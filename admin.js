// scripts.js

// Sample Data for Charts
const volunteerData = [50, 60, 70, 80, 90, 100,50, 60, 70, 80, 90, 100];
const charityData = [30, 40, 50, 60, 70, 80,30, 40, 50, 60, 70, 80];
const donationData = [200, 150, 300, 250, 400, 350,30, 40, 50, 60, 70, 80];

const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','July','Aug','Sep','Oct','Nov','Dec'];

// Volunteer & Charity Chart
const ctx = document.getElementById('volunteerCharityChart').getContext('2d');
const volunteerCharityChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: months,
        datasets: [
            {
                label: 'Volunteers',
                data: volunteerData,
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            },
            {
                label: 'Charities',
                data: charityData,
                backgroundColor: 'rgba(153, 102, 255, 0.2)',
                borderColor: 'rgba(153, 102, 255, 1)',
                borderWidth: 1
            }
        ]
    },
    options: {
        responsive: true,
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});

// Donation Chart
const donationCtx = document.getElementById('donationChart').getContext('2d');
const donationChart = new Chart(donationCtx, {
    type: 'pie',
    data: {
        labels: months,
        datasets: [{
            data: donationData,
            backgroundColor: [
                'rgba(25, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(265, 99, 132)',
                'rgba(54, 182, 235, 0.2)',
                'rgba(255, 206, 86, 2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(13, 02, 255, 0.2)',
                'rgba(25, 159, 4, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        responsive: true
    }
});

// Set Counts
document.getElementById('donationCount').innerText = donationData.reduce((a, b) => a + b, 0);
document.getElementById('volunteerCount').innerText = volunteerData.reduce((a, b) => a + b, 0);
document.getElementById('charityCount').innerText = charityData.reduce((a, b) => a + b, 0);

// Download PDF Functionality

document.getElementById('downloadPDF').addEventListener('click', () => {
    const pdfContent = document.getElementById('content');
    const opt = {
        margin: 1,
        filename: 'ServeTogether12.pdf',
        html2canvas: { scale: 2 },
        jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
    };

    html2pdf().from(pdfContent).set(opt).save();
});
