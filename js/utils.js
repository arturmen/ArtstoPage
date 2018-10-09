function getRandomElement(arr) {
    return arr[Math.floor((Math.random() * arr.length))];
}

function sanitazeName(str) {
    return str.replace(/[^a-z0-9]/gi, '').toLowerCase();
}

function filterifyName(str) {
    return "pf-" + sanitazeName(str)
}

function dictToList(dict) {
    return Object.keys(dict).map(function (key) {
        return dict[key];
    });
}

