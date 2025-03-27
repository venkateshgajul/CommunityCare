// Function to generate a random CAPTCHA
function generateCaptcha() {
  const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
  let captcha = "";
  for (let i = 0; i < 6; i++) {
    captcha += chars[Math.floor(Math.random() * chars.length)];
  }
  return captcha;
}

// Initialize CAPTCHA when the page loads
document.addEventListener('DOMContentLoaded', function() {
  // Initialize CAPTCHA
  let currentCaptcha = generateCaptcha();
  document.getElementById("captchaText").textContent = currentCaptcha;
  
  // Refresh CAPTCHA
  document.getElementById("refreshCaptcha").addEventListener("click", () => {
    currentCaptcha = generateCaptcha();
    document.getElementById("captchaText").textContent = currentCaptcha;
    document.getElementById("captchaInput").value = "";
    document.getElementById("errorMessage").style.display = "none";
  });
  
  // Form submission
  document.getElementById("statusForm").addEventListener("submit", (e) => {
    e.preventDefault();
    const userCaptcha = document.getElementById("captchaInput").value;
    
    if (userCaptcha === currentCaptcha) {
      // CAPTCHA is correct, proceed with form submission
      document.getElementById("errorMessage").style.display = "none";
      
      // Create a hidden input to store the validated captcha status
      const validatedInput = document.createElement('input');
      validatedInput.type = 'hidden';
      validatedInput.name = 'captchaValidated';
      validatedInput.value = 'true';
      document.getElementById("statusForm").appendChild(validatedInput);
      
      // Submit the form to the server
      document.getElementById("statusForm").submit();
    } else {
      // CAPTCHA is incorrect
      document.getElementById("errorMessage").textContent = "Invalid CAPTCHA. Please try again.";
      document.getElementById("errorMessage").style.display = "block";
      // Regenerate CAPTCHA
      currentCaptcha = generateCaptcha();
      document.getElementById("captchaText").textContent = currentCaptcha;
      document.getElementById("captchaInput").value = "";
    }
  });
});