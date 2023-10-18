document.addEventListener('DOMContentLoaded', function() {
    let currentIndex = 0;

    function showSlide(index) {
        const slides = document.querySelectorAll('.carousel-item');
        slides.forEach((slide) => slide.classList.remove('active'));
        slides[index].classList.add('active');
    }

    function changeSlide(direction) {
        currentIndex += direction;
        const slides = document.querySelectorAll('.carousel-item');
        if (currentIndex >= slides.length) {
            currentIndex = 0;
        } else if (currentIndex < 0) {
            currentIndex = slides.length - 1;
        }
        showSlide(currentIndex);
    }

    document.querySelector('.carousel-control-prev').addEventListener('click', function(e) {
        e.preventDefault();
        changeSlide(-1);
    });

    document.querySelector('.carousel-control-next').addEventListener('click', function(e) {
        e.preventDefault();
        changeSlide(1);
    });
});

