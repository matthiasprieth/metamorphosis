$( window ).load( function()
{
    $('#masonry-container').masonry({
        itemSelector: '.img-polaroid'
    });

    $('.polaroid-images').adipoli({
        'startEffect' : 'normal',
        'hoverEffect' : 'popout'
    });
});

