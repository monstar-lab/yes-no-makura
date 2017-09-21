(() => {
    App.total = App.cable.subscriptions.create("TotalChannel", {
        connected: () => {},
        disconnected: () => {},
        received: data => {
            const editnum = data;
            if (location.pathname === '/questions/'+ data['nowid'] + '/result') {
                console.log("yes:" + editnum['yescon']);
                console.log("ans:" + editnum['anscon']);
                console.log("nowid:" + editnum['nowid']);
                const answersCountEle = document.getElementById("answers-count");
                const yesCountEle = document.getElementById("yes-count");
                answersCountEle.textContent = "/" + editnum['anscon'];
                yesCountEle.textContent = "" + editnum['yescon'];
            }
        }
    });
})();
