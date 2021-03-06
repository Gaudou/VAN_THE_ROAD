// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";



// Internal imports, e.g:
import { initSweetalert } from '../plugins/init_sweetalert';
import { initMapbox } from '../plugins/init_mapbox';

// import { initSelect2 } from '../components/init_select2';



document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initSweetalert('#booking-confirmation', {
    title: "Booking confirmed!",
    text: "Great, isn't it?",
    icon: "success"
  }, (value) => {
     if (value) {
    const link = document.querySelector('#submit-booking');
    link.click();
  }
});

  initSweetalert('#delete-van-confirmation', {
    title: "Are you sure?",
    text: "You are going to remove permanently your vehicle",
    icon: "warning",
    buttons: true,
    dangerMode: true,
  }, (value) => {
    if (value) {
      const link = document.querySelector('#delete-van-btn');
      link.click();
    }
  });
});
