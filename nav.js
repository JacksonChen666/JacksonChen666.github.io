async function openNav() {
    document.getElementById("navL").style.width = "250px";
    await sleep(140);
    document.getElementById("nav").style.width = "250px";
}
async function closeNav() {
    document.getElementById("nav").style.width = "0";
    await sleep(50);
    document.getElementById("navL").style.width = "0";
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

//slep
function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}