
// 0 - 20
// "#cfd1d2"

function greatnessToColor(x) {
    if (x < 14) {
        return "#cfd1d2"
    } else if (x <= 19) {
        return "#02a2f1"
    } else {
        return "#f8b642"
    }
}

const p1 = '<svg width="300" height="420"> <path d="M139 280l-1.241-10.217c-1.242-10.218-3.725-30.652-8.654-51.087-4.929-20.434-12.303-40.869-15.99-51.086l-3.688-10.218 2.39-6.454c2.39-6.454 7.168-19.362 9.502-32.27 2.333-12.909 2.22-25.817 2.164-32.271l-.056-6.455 9.678 7.825c9.678 7.824 29.033 23.472 35.296 56.815 6.262 33.343-.57 84.38-3.985 109.9L161 280" fill='
var p2 = greatnessToColor(x) 
const p3 = '/> <path d="M123.427 79.942l8.696 9.152c8.696 9.15 26.087 27.453 32.35 60.796 6.262 33.343 1.394 81.727-1.04 105.918L161 280" fill="none" stroke="#e2e3e4" stroke-width="6" /> <path d="M139 280l-1.241-10.217c-1.242-10.218-3.725-30.652-8.654-51.087-4.929-20.434-12.303-40.869-15.99-51.086l-3.688-10.218h0l2.39-6.454c2.39-6.454 7.168-19.362 9.502-32.27 2.333-12.909 2.22-25.817 2.164-32.271l-.056-6.455h0l9.678 7.825c9.678 7.824 29.033 23.472 35.296 56.815 6.262 33.343-.57 84.38-3.985 109.9L161 280" fill="none" stroke="#a0a3a5" stroke-width="3" /> <path d="M137 280a13 13 0 1126 0h-13z" fill="#775953" stroke="#3b291e" stroke-width="3" /> <defs> <pattern id="prefix__a" patternUnits="userSpaceOnUse" width="7" height="7"> <path fill="#a09277" d="M0 0h7v7H0z" /> <circle cx="3.5" cy="3.5" r="2.5" fill="#776b53" stroke="#343434" stroke-width="0" /> </pattern> </defs> <path d="M139 290h22l-5 32h-12z" fill="url(#prefix__a)" stroke="#3b291e" stroke-width="3" /> <path d="M175.5 280c1.77.23 4.77 9.77 3.5 10-1.27.23-56.73.23-58 0-1.27-.23 1.73-9.77 3-10 1.27-.23 50.73-.23 52 0" fill="#776b53" stroke="#3b291e" stroke-width="3" /> <circle cx="150" cy="322" r="11" fill="#776b53" stroke="#3b291e" stroke-width="3" /> <circle cx="150" cy="322" r="5.5" fill="#eee58b" stroke="#3b291e" stroke-width="3" /> </svg>'

const elements = [p1, p2, p3];
const svgString = elements.join('')



string[17] memory parts;
parts[0] = 