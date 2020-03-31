async function openNav() {
    document.getElementById("navL").style.width = "250px";
    await sleep(50);
    document.getElementById("nav").style.width = "250px";
}
async function closeNav() {
    document.getElementById("nav").style.width = "0";
    await sleep(50);
    document.getElementById("navL").style.width = "0";
}

async function clickLink(rLink) {
    closeNav();
    await sleep(350);
    window.location.href = rLink;
}

//slep
function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}