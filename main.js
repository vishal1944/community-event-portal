console.log("InnovateX Community Platform Loaded");

window.onload = function () {
    showNotification(
        "Welcome to InnovateX Community Platform 🚀"
    );
};

function showNotification(message) {

    const msg =
        document.getElementById("successMessage");

    msg.innerHTML = message;

    setTimeout(() => {
        msg.innerHTML = "";
    }, 3000);
}

function scrollToEvents() {

    document
        .getElementById("events")
        .scrollIntoView({
            behavior: "smooth"
        });
}

function registerEvent(eventName) {

    document.getElementById("eventType").value =
        eventName;

    showNotification(
        "Selected: " + eventName
    );
}

function countChars() {

    let text =
        document.getElementById("message").value;

    document.getElementById("count").innerHTML =
        text.length;

    if (text.length > 200) {

        document.getElementById("count")
            .style.color = "red";

    } else {

        document.getElementById("count")
            .style.color = "green";
    }
}

document
    .getElementById("registrationForm")
    .addEventListener("submit", function (e) {

        e.preventDefault();

        let name =
            document.getElementById("name").value;

        let email =
            document.getElementById("email").value;

        let event =
            document.getElementById("eventType").value;

        if (
            name === "" ||
            email === "" ||
            event === ""
        ) {

            showNotification(
                "Please fill all fields!"
            );

            return;
        }

        localStorage.setItem(
            "userRegistration",
            JSON.stringify({
                name,
                email,
                event
            })
        );

        showNotification(
            "Registration Successful ✅"
        );

        this.reset();

        document.getElementById("count")
            .innerHTML = "0";
    });

function getLocation() {

    if (navigator.geolocation) {

        navigator.geolocation.getCurrentPosition(
            function (position) {

                let lat =
                    position.coords.latitude;

                let lon =
                    position.coords.longitude;

                document.getElementById("location")
                    .innerHTML =

                    `Latitude: ${lat}<br>
                     Longitude: ${lon}<br><br>

                     <a target="_blank"
                     href="https://www.google.com/maps?q=${lat},${lon}">
                     Open in Google Maps
                     </a>`;
            }
        );

    } else {

        document.getElementById("location")
            .innerHTML =
            "Geolocation not supported.";
    }
}