// Main JS
function autoRefresh() {
    if (sessionStorage.getItem("refresh") == "true") {
        sessionStorage.removeItem("refresh");
        window.location.reload()
    }
}

function test() {
    document.findElementById("").innerHTML = ""
}

function redirectWaitThenShow() {
    // sleep(3);
    document.getElementById("homeR").innerHTML = "Redirecting...";
    document.getElementById("homeR3").innerHTML = "Click here if you aren't being redirected";
}

function hnav() {
    $("#hnav").load("header-and-nav.html");
}

function easterEgg() {
    document.write("no way");
}

function loadAlert() {
    alert("Loaded element");
}

function forms() {
    var question_submitted_already = false;
    if (question_submitted_already == false) {
        question_submitted_already = true;
        document.forms["ask"].submit();
    }
    window.addEventListener('pageshow', function(e) {
        question_submitted_already = false;
    });
}

function billWurtzQuestionsJS() {
    var question_submitted_already = false;

    function submit_question() {
        if (question_submitted_already == false) {
            question_submitted_already = true;
            document.forms["ask"].submit();
        }
    }


    function on_press(e) {
        var code = (e.keyCode ? e.keyCode : e.which);

        // check for orientation field on mobile 
        if (!(typeof window.orientation !== "undefined") || (navigator.userAgent.indexOf('IEMobile') !== -1)) {
            var question = document.getElementsByName("question")[0].value;

            // if u press enter and no shift, send q
            if (code == 13 && !e.shiftKey && question.length < CHARACTERS_TO_DISALLOW_ENTER) {

                submit_question();
                e.preventDefault();

            }
        }
    }

    //does not refresh the page!!!! on safari back or reload of page make the question not submitted
    window.addEventListener('pageshow', function(e) {
        question_submitted_already = false;
        document.getElementsByName("question")[0].value = "";
    });
}

// thing JS
function coolReset() {
    while (true) {
        if (time > 0) {
            console.log("Over")
            time -= 1;
            setTimeout(spacebarGame(), 10)
        } else {
            if (time < 0) {
                console.log("under")
                time = 0;
                setTimeout(spacebarGame(), 10)
            } else { return }
        }
    }
}

function remove() {
    time -= 1;
    spacebarGame();
}

// live html (other stuff actually)
function changeKeyPress(elementID, keyCode, text)  {
    window.addEventListener("keydown", function(event)  {
        if (event.keyCode == keyCode)  {
            event.preventDefault();
            insertAtCaret(elementID, text);
        }
    });
}