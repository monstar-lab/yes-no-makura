var shuffleNumber = 60;
var waitTime = 100;
var cnt = 0;
var ranBef = 0;
function randomNumber (maxNumber, minNumber) {
    return Math.round(minNumber + (Math.random() * (maxNumber - minNumber)));
}
function makeRandom (randomBefore) {
    maxNumber = answersCount - (((answersCount - yesCount) / shuffleNumber) * cnt);
    minNumber = (yesCount / shuffleNumber) * cnt;
    var random = randomNumber(maxNumber, minNumber);
    while (random === randomBefore) {
        random = randomNumber(maxNumber, minNumber);
        if ((maxNumber - minNumber) <= 1) {
            random = randomBefore;
            break;
        }
    }
    return random;
}
function changeNumber (number) {
    document.getElementById('yes-count').innerText = number;
}
window.onload = function () {
    var setTimer = setInterval(function () {
        var number = makeRandom(ranBef);
        changeNumber(number);
        if (cnt >= shuffleNumber) {
            clearInterval(setTimer);
            changeNumber(yesCount);
        }
        ranBef = number;
        cnt++;
    }, waitTime);
};
