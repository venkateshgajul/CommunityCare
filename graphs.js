// scripts.js

        // Sample Data
        const waterIssues = [20, 30, 25, 40, 35, 50, 45, 30, 25, 40, 50, 60];
        const electricityIssues = [15, 25, 30, 20, 45, 35, 40, 50, 30, 20, 25, 35];
        const roadIssues = [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65];
        const sanitationIssues = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60];
        
        const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        
        // Create Chart
        const ctx1 = document.getElementById('issuesChart').getContext('2d');
        const issuesChart = new Chart(ctx1, {
            type: 'bar',
            data: {
                labels: months,
                datasets: [
                    {
                        label: 'Water Issues',
                        data: waterIssues,
                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1
                    },
                    {
                        label: 'Electricity Issues',
                        data: electricityIssues,
                        backgroundColor: 'rgba(255, 206, 86, 0.2)',
                        borderColor: 'rgba(255, 206, 86, 1)',
                        borderWidth: 1
                    },
                    {
                        label: 'Damaged Road Issues',
                        data: roadIssues,
                        backgroundColor: 'rgba(255, 99, 132, 0.2)',
                        borderColor: 'rgba(255, 99, 132, 1)',
                        borderWidth: 1
                    },
                    {
                        label: 'Sanitation Issues',
                        data: sanitationIssues,
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
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

        const ctx = document.getElementById('issueChart').getContext('2d');
        const issueChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: ['Water Issues', 'Electricity Issues', 'Damaged Roads', 'Sanitation'],
                datasets: [{
                    data: [45, 30, 55, 25], // Example data counts
                    backgroundColor: [
                        'rgba(54, 162, 235, 0.6)',
                        'rgba(255, 206, 86, 0.6)',
                        'rgba(255, 99, 132, 0.6)',
                        'rgba(75, 192, 192, 0.6)'
                    ],
                    borderColor: [
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(255, 99, 132, 1)',
                        'rgba(75, 192, 192, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    }
                }
            }
        });



// Download PDF Functionality

document.addEventListener('DOMContentLoaded', () => {
    document.getElementById('downloadPDF').addEventListener('click', () => {  
        const pdfContent = document.getElementById('content');

        if (!pdfContent) {
            alert("Error: No content found to download.");
            return;
        }

        const opt = {
            margin: 1,
            filename: 'CommunityCare.pdf',
            image: { type: 'jpeg', quality: 0.98 },
            html2canvas: { scale: 2 },
            jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
        };

        html2pdf().from(pdfContent).set(opt).save();
    });
});
