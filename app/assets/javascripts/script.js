$(function() {
    $('.carousel-inner .item').first().addClass('active');
    $("#myCarousel").carousel({
        interval: 6000,
        pause: 'none'
    });
});