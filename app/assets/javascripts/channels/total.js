(() => {
    App.total = App.cable.subscriptions.create("TotalChannel", {
        connected: function() {},
        disconnected: function() {},
        received: function(data) {
            const editnum = data;
            if (location.pathname === '/questions/'+ data['nowid'] + '/result') {
                console.log("yes:" + editnum['yescon']);
                console.log("ans:" + editnum['anscon']);
                console.log("nowid:" + editnum['nowid']);
                console.log("nowbody:" + editnum['nowbody']);
                const answersCountEle = document.getElementById("answers-count");
                const yesCountEle = document.getElementById("yes-count");
                answersCountEle.textContent = "/" + editnum['anscon'];
                yesCountEle.textContent = "" + editnum['yescon'];
            }
        }
    });
})();
