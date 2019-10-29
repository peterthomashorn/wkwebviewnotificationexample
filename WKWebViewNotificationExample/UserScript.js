window.Notification = function (messageText) {
    window.webkit.messageHandlers.notify.postMessage(messageText);
};
