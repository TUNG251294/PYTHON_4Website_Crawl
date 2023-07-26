import { useEffect } from "react";

let cloudinary;
let widget;

const UploadWidget = ({ children, onUpload }) => {
  useEffect(() => {
    // Store the Cloudinary window instance to a ref when the page renders

    if (!cloudinary) {
      cloudinary = window.cloudinary;
    }

    // To help improve load time of the widget on first instance, use requestIdleCallback
    // to trigger widget creation. If requestIdleCallback isn't supported, fall back to
    // setTimeout: https://caniuse.com/requestidlecallback

    function onIdle() {
      if (!widget) {
        widget = createWidget();
      }
    }

    "requestIdleCallback" in window
      ? requestIdleCallback(onIdle)
      : setTimeout(onIdle, 1);

    // eslint-disable-next-line
  },[]);

  /**
   * createWidget
   * @description Creates a new instance of the Cloudinary widget and stores in a ref
   */

  function createWidget() {

    const options = {
      cloudName: "dgfajkcce", // Ex: mycloudname
      uploadPreset: "itwtij4q", // Ex: myuploadpreset
    };

    return cloudinary?.createUploadWidget(options, function (errorImage, result) {
      // The callback is a bit more chatty than failed or success so
      // only trigger when one of those are the case. You can additionally
      // create a separate handler such as onEvent and trigger it on
      // ever occurance
      if (errorImage || result.event === "success") {
        onUpload(errorImage, result, widget);
      }
    });
  }

  /**
   * open
   * @description When triggered, uses the current widget instance to open the upload modal
   */

function  open() {
    widget = createWidget();
    widget && widget.open();
  }

  return <>{children({ cloudinary, widget, open })}</>;
};

export default UploadWidget;
