document.addEventListener('DOMContentLoaded', () => {
  const form = document.getElementById("staffTransferForm");

  form.addEventListener("submit", async (event) => {
    event.preventDefault();

    const staffNumber = document.getElementById('staffNumber').value;
    const department = document.getElementById('department').value;
    const token = localStorage.getItem("token");

    const data = {
      staffNumber,
      department
    };

    try {
      const response = await fetch('/staff/transferStaff', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${token}`
        },
        body: JSON.stringify(data)
      });

      if (response.ok) {
        alert('Staff transfer successful!');
      } else {
        const errorData = await response.json();
        alert(`Error: ${errorData.message}`);
      }
    } catch (error) {
      alert(`Network error: ${error.message}`);
    }
  });
});