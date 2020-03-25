function openNav() {
    document.getElementById("nav").style.width = "250px";
}
function closeNav() {
    document.getElementById("nav").style.width = "0";
}

// javascript animations? refer to animations.js
function leaveAnimation() {
    document.getElementById('all-animation').style.animation = "leave";
}
function clickLink(rLink) {
    closeNav();
    leaveAnimation();
    window.location.href = rLink;
}