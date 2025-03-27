let currentIndex = 0;

function updateSlidePosition() {
    const slides = document.querySelector('.slides');
    const totalSlides = slides.children.length;
    const translateXValue = -currentIndex * 100;
    slides.style.transform = `translateX(${translateXValue}%)`;
}

function showNextSlide() {
    const slides = document.querySelector('.slides');
    const totalSlides = slides.children.length;
    currentIndex = (currentIndex + 1) % totalSlides;
    updateSlidePosition();
}

function showPrevSlide() {
    const slides = document.querySelector('.slides');
    const totalSlides = slides.children.length;
    currentIndex = (currentIndex - 1 + totalSlides) % totalSlides;
    updateSlidePosition();
}

// Auto slide every 10 seconds
setInterval(showNextSlide, 10000);
