document.addEventListener("DOMContentLoaded", function () {
  // Sample Data
  const issues = [
    {
      id: 1,
      category: "roads",
      description: "Pothole on Main Street",
      location: "City A",
      reportedBy: "John Doe",
      dateReported: "2023-10-01",
      status: "open",
    },
    {
      id: 2,
      category: "water",
      description: "Leaking water pipe",
      location: "City B",
      reportedBy: "Jane Smith",
      dateReported: "2023-10-02",
      status: "in-progress",
    },
  ];

  const issueTable = document.querySelector("#issueTable tbody");
  const updateModal = document.getElementById("updateModal");
  const closeModal = document.querySelector(".close");

  // Render Issues Table
  function renderIssues(filteredIssues = issues) {
    issueTable.innerHTML = "";
    filteredIssues.forEach((issue) => {
      const row = document.createElement("tr");
      row.innerHTML = `
        <td>${issue.id}</td>
        <td>${issue.category}</td>
        <td>${issue.description}</td>
        <td>${issue.location}</td>
        <td>${issue.reportedBy}</td>
        <td>${issue.dateReported}</td>
        <td>${issue.status}</td>
        <td><button onclick="openUpdateModal(${issue.id})">Update</button></td>
      `;
      issueTable.appendChild(row);
    });
  }

  // Open Update Modal
  window.openUpdateModal = function (issueId) {
    const issue = issues.find((issue) => issue.id === issueId);
    if (issue) {
      document.getElementById("updateStatus").value = issue.status;
      document.getElementById("resolutionNotes").value = "";
      updateModal.style.display = "block";
    }
  };

  // Close Update Modal
  closeModal.addEventListener("click", () => {
    updateModal.style.display = "none";
  });

  // Apply Filters
  document.getElementById("filterForm").addEventListener("submit", (e) => {
    e.preventDefault();
    const category = document.getElementById("category").value;
    const status = document.getElementById("status").value;
    const location = document.getElementById("location").value.toLowerCase();

    const filteredIssues = issues.filter((issue) => {
      return (
        (category === "all" || issue.category === category) &&
        (status === "all" || issue.status === status) &&
        (location === "" || issue.location.toLowerCase().includes(location))
      );
    });

    renderIssues(filteredIssues);
  });

  // Render Charts (using Chart.js)
  const pieChart = new Chart(document.getElementById("pieChart"), {
    type: "pie",
    data: {
      labels: ["Roads", "Water", "Electricity"],
      datasets: [
        {
          data: [10, 5, 3],
          backgroundColor: ["#FF6384", "#36A2EB", "#FFCE56"],
        },
      ],
    },
  });

  const barChart = new Chart(document.getElementById("barChart"), {
    type: "bar",
    data: {
      labels: ["City A", "City B", "City C"],
      datasets: [
        {
          label: "Issues Reported",
          data: [12, 19, 3],
          backgroundColor: ["#FF6384", "#36A2EB", "#FFCE56"],
        },
      ],
    },
  });

  const lineChart = new Chart(document.getElementById("lineChart"), {
    type: "line",
    data: {
      labels: ["Jan", "Feb", "Mar", "Apr", "May"],
      datasets: [
        {
          label: "Issues Resolved",
          data: [5, 10, 8, 12, 15],
          borderColor: "#36A2EB",
          fill: false,
        },
      ],
    },
  });

  // Initial Render
  renderIssues();
});