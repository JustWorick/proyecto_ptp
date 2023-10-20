document.addEventListener('DOMContentLoaded', function() {
    let currentIndex1 = 0;
    let currentIndex2 = 0;

    function showSlide(index, carouselId) {
        const slides = document.querySelectorAll(`#${carouselId} .carousel-item`);
        slides.forEach((slide) => slide.classList.remove('active'));
        slides[index].classList.add('active');
    }

    function changeSlide(direction, carouselId) {
        if (carouselId === 'carouselExampleIndicators') {
            currentIndex1 += direction;
            const slides = document.querySelectorAll(`#${carouselId} .carousel-item`);
            if (currentIndex1 >= slides.length) {
                currentIndex1 = 0;
            } else if (currentIndex1 < 0) {
                currentIndex1 = slides.length - 1;
            }
            showSlide(currentIndex1, carouselId);
        } else if (carouselId === 'carouselExampleAutoplaying') {
            currentIndex2 += direction;
            const slides = document.querySelectorAll(`#${carouselId} .carousel-item`);
            if (currentIndex2 >= slides.length) {
                currentIndex2 = 0;
            } else if (currentIndex2 < 0) {
                currentIndex2 = slides.length - 1;
            }
            showSlide(currentIndex2, carouselId);
        }
    }

    // Añade event listeners para los botones de control del primer carrusel
    document.querySelector('#carouselExampleIndicators .carousel-control-prev').addEventListener('click', function(e) {
        e.preventDefault();
        changeSlide(-1, 'carouselExampleIndicators');
    });

    document.querySelector('#carouselExampleIndicators .carousel-control-next').addEventListener('click', function(e) {
        e.preventDefault();
        changeSlide(1, 'carouselExampleIndicators');
    });

    // Añade event listeners para los botones de control del segundo carrusel
    document.querySelector('#carouselExampleAutoplaying .carousel-control-prev').addEventListener('click', function(e) {
        e.preventDefault();
        changeSlide(-1, 'carouselExampleAutoplaying');
    });

    document.querySelector('#carouselExampleAutoplaying .carousel-control-next').addEventListener('click', function(e) {
        e.preventDefault();
        changeSlide(1, 'carouselExampleAutoplaying');
    });
});

