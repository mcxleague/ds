// MINECRAFT
document.getElementById('minecraftCopy').addEventListener('click', function() {
  const textToCopy = "hypixel.net";
  copyToClipboard(textToCopy);
});

// DISCORD
document.getElementById('discordCopyy').addEventListener('click', function() {
  const textToCopy = "discord.gg/hypixel";
  copyToClipboard(textToCopy);
});


// Function to copy the text to clipboard
function copyToClipboard(text) {
  const tempInput = document.createElement('textarea');
  tempInput.value = text;
  document.body.appendChild(tempInput);
  tempInput.select();
  document.execCommand('copy');
  document.body.removeChild(tempInput);

  // Show SweetAlert2 alert on successful copy
  Swal.fire({
    icon: 'success',
    title: 'Copied!',
    text: 'Text has been copied to clipboard.',
    showConfirmButton: false,
    timer: 1500 // Set the time the alert will be shown (in milliseconds)
  });
}





// @license magnet:?xt=urn:btih:d3d9a9a6595521f9666a5e94cc830dab83b65699&dn=expat.txt Expat/MIT
function fixFooter() {
    var footerHeight = $("#footer").outerHeight() + "px";
    var wrapperHeight = "calc(100vh - " + footerHeight + ")";
    $("#wrapper").css({ 'min-height': wrapperHeight });
}

$(document).ready(fixFooter);
$(window).resize(fixFooter);
	
const mainColor = getComputedStyle(document.documentElement).getPropertyValue('--main-color').trim();
const particleColor = mainColor;

particlesJS("particles", {
  "particles": {
    "number": {
      "value": 50
    },
    "color": {
      "value": particleColor
    },
    "shape": {
      "type": "circle"
    },
    "opacity": {
      "value": 0.5,
      "random": false,
      "anim": {
        "enable": false
      }
    },
    "size": {
      "value": 10,
      "random": true,
      "anim": {
        "enable": false
      }
    },
    "line_linked": {
      "enable": false
    },
    "move": {
      "enable": true,
      "speed": 2,
      "direction": "top",
      "out_mode": "out"
    }
  },
  "interactivity": {
    "events": {
      "onhover": {
        "enable": false
      },
      "onclick": {
        "enable": false
      }
    }
  },
  "retina_detect": true
});

$(document).ready(function() {
  $('.navbar-toggle').click(function() {
    $('.mobile-nav').toggleClass('active');
    $('.mobile-overlay').toggleClass('active');
  });

  $('.navbar-toggle-remove').click(function() {
    $('.mobile-nav').removeClass('active');
    $('.mobile-overlay').removeClass('active');
  });
});