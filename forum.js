// DOM Elements
const startDiscussionBtn = document.getElementById('startDiscussionBtn');
const discussionModal = document.getElementById('discussionModal');
const suggestionModal = document.getElementById('suggestionModal');
const closeButtons = document.querySelectorAll('.close');
const discussionForm = document.getElementById('discussionForm');
const suggestionForm = document.getElementById('suggestionForm');
const discussionList = document.querySelector('.discussion-list');
const suggestionList = document.querySelector('.suggestion-list');

// Open Discussion Modal
startDiscussionBtn.addEventListener('click', () => {
  discussionModal.style.display = 'block';
});

// Close Modals
closeButtons.forEach(button => {
  button.addEventListener('click', () => {
    discussionModal.style.display = 'none';
    suggestionModal.style.display = 'none';
  });
});

// Submit Discussion Form
discussionForm.addEventListener('submit', (e) => {
  e.preventDefault();
  const title = document.getElementById('discussionTitle').value;
  const description = document.getElementById('discussionDescription').value;

  const discussionCard = document.createElement('div');
  discussionCard.classList.add('discussion-card');
  discussionCard.innerHTML = `
    <h3 style="padding-bottom:8px; font-size:20px;">${title}</h3>
    <p style="padding-bottom:8px;" font-size:18px;>${description}</p>
    <button class="addSuggestionBtn" style="font-size: 18px;
  padding: 2px;
  border-radius: 6px;
  background: #1c2439;
  color: #fff7f5;
  width: 32%;
  height: 42%;">Add Suggestion</button>
  `;
  discussionList.appendChild(discussionCard);

  discussionModal.style.display = 'none';
  discussionForm.reset();
});

// Open Suggestion Modal
discussionList.addEventListener('click', (e) => {
  if (e.target.classList.contains('addSuggestionBtn')) {
    suggestionModal.style.display = 'block';
  }
});

// Submit Suggestion Form
suggestionForm.addEventListener('submit', (e) => {
  e.preventDefault();
  const suggestionText = document.getElementById('suggestionText').value;

  const suggestionCard = document.createElement('div');
  suggestionCard.classList.add('suggestion-card');
  suggestionCard.innerHTML = `
    <p style="padding-bottom:8px;
    font-size:18px;">${suggestionText}</p>
    <i class="fa-solid fa-thumbs-up likeBtn" style="font-size:20px;" class="likeBtn"></i>
    <span class="likeCount">0</span>
  `;
  suggestionList.appendChild(suggestionCard);

  suggestionModal.style.display = 'none';
  suggestionForm.reset();
});

// Like Functionality
suggestionList.addEventListener('click', (e) => {
  if (e.target.classList.contains('likeBtn')) {
    const likeCount = e.target.nextElementSibling;
    likeCount.textContent = parseInt(likeCount.textContent) + 1;
  }
});