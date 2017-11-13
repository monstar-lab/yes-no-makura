(() => {
    App.answers = App.cable.subscriptions.create('AnswersChannel', {
        connected: () => {},
        disconnected: () => {},
        received: data => {
            if (location.pathname === `/questions/${data['current_id']}/result`) {
                const answersCountEle = document.getElementById('answers-count');
                const yesCountEle = document.getElementById('yes-count');
                answersCountEle.textContent = '/' + data['answers_count'];
                yesCountEle.textContent = data['yes_count'].toString();
            }
        }
    });
})();
