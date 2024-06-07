document.addEventListener('DOMContentLoaded', function() {
    const player = document.querySelector('#media-player');
    const frames = player?.querySelectorAll('.frame');
    let currentFrameIndex = 0;

    function showFrame(index: number) {
        frames?.forEach((frame, idx) => {
            frame.classList.toggle('active', idx === index);
        });
    }

    function nextFrame() {
        currentFrameIndex = (currentFrameIndex + 1) % (frames?.length || 1);
        showFrame(currentFrameIndex);
    }

    function prevFrame() {
        currentFrameIndex = (currentFrameIndex - 1 + (frames?.length || 1)) % (frames?.length || 1);
        showFrame(currentFrameIndex);
    }

    document.querySelector('#next-button')?.addEventListener('click', nextFrame);
    document.querySelector('#prev-button')?.addEventListener('click', prevFrame);

    showFrame(currentFrameIndex);
});
