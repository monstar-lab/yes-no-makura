(() => {
    App.answers = App.cable.subscriptions.create("AnswersChannel", {
        connected: () => {},
        disconnected: () => {},
        received: data => {
            const count = data;
            if (location.pathname === '/questions/'+ data['current_id'] + '/result') {
                console.log("yesCount:" + count['yes_count']);
                console.log("answersCount:" + count['answers_count']);
                console.log("currentId:" + count['current_id']);
                const answersCountEle = document.getElementById("answers-count");
                const yesCountEle = document.getElementById("yes-count");
                answersCountEle.textContent = "/" + count['answers_count'];
                yesCountEle.textContent = "" + count['yes_count'];
            }
        }
    });
})();
