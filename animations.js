function leaveAnimation() {
    document.getElementById('all-animation').className = 'all-animation';
}

function clickLink(link) {
    leaveAnimation();
    window.location.href = link;
}
