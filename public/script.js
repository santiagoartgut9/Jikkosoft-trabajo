// Animación para las barras de habilidades cuando se hace scroll
document.addEventListener('DOMContentLoaded', function() {
    // Animación de las barras de habilidades
    const skillBars = document.querySelectorAll('.skill-level');
    
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const skillLevel = entry.target;
                skillLevel.style.width = skillLevel.style.width;
            }
        });
    }, { threshold: 0.5 });
    
    skillBars.forEach(bar => {
        observer.observe(bar);
    });
    
    // Efecto de impresión para el título
    const title = document.querySelector('.header-text h1');
    const originalText = title.textContent;
    title.textContent = '';
    
    let i = 0;
    const typeWriter = () => {
        if (i < originalText.length) {
            title.textContent += originalText.charAt(i);
            i++;
            setTimeout(typeWriter, 50);
        }
    };
    
    // Iniciar efecto de escritura después de un breve retraso
    setTimeout(typeWriter, 500);
});
