/*check mobile device*/
if(window.matchMedia) {
    if (window.matchMedia("(max-device-width: 800px)").matches) {
       /* a mobile deivice */
      window.location = "mb_index.jsp";
    } else if (window.matchMedia("(-webkit-min-device-pixel-ratio: 2.5)").matches) {
       /* a mobile deivice */
      window.location = "mb_index.jsp";
    } else {
       /* a mobile deivice */
    }

}
