/*
 * Nostalgia screensaver.
 *
 * Usage:
 *   mount --bind ./screensaver-main.qml /usr/palm/applications/com.webos.app.screensaver/qml/main.qml
 *
 * Test launch (no way to trigger on "No signal" screen)
 *   luna-send -n 1 'luna://com.webos.service.tvpower/power/turnOnScreenSaver' '{}'
 */
import QtQuick 2.4
import Eos.Window 0.1
import QtQuick.Window 2.2

WebOSWindow {
    id: window

    width: 1920
    height: 1080

    windowType: "_WEBOS_WINDOW_TYPE_SCREENSAVER"
    color: "black"

    title: "Screensaver"
    appId: "com.webos.app.screensaver"
    visible: true

    Item {
        id: root

        Rectangle {
            anchors.fill: parent
            color: 'black'
        }

        Rectangle {
            id: boing

            color: 'black'
            width: 320
            height: 163

            function setRandomColor() {
                var colors = ['#f00', '#0f0', '#00f', '#ff0', '#f0f', '#0ff', '#fff'];
                var index = (Math.random() * colors.length) | 0;
                boing.color = colors[index];
            }

            Image {
                anchors.fill: parent
                source: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAA6wAAAO6CAYAAACbtNrCAAAAAXNSR0IArs4c6QAAADhlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAAqACAAQAAAABAAADrKADAAQAAAABAAADugAAAABXfnMNAABAAElEQVR4Aey9Sa8l13muuVb0zd6nzXOykUiKvmWVkWmjAHvmiTjwtCYFkH/h/gxm/gkN6g/UgJrdGgoQCQM1KEAFXJQyB7RhSRaV3cmTp9lN7OjreVecSKaudcu+stUkuYKME7GjWc0XO4H9xPs11vjFW8BbwFvAW8BbwFvAW8Bb4NtoATuOmrb7Yx49emT16f79x/bJyQN798un9md1GhwvV3bv4tBeX9fhubkKzl9chqvL5+F2U4dlEYdpktnFYhmcnt6x1gTButvYuIuttX3UmiGKoiS0Joxs20c2DqO7d+5k/+nP/iwvyzJ/fXGZf/X0q3zshmzg2u1qHVZNHQVBGJ2eHIdJUrCmpqp2drfbmiwrzKIszdCPtu86eguMjQJGHZh2tzOvzs/NxdWVGTpjiiI3J7dvm8P9AzMMg6l3jWn6RlN09yVhwqime0fOD9wUBJGJk4Stu4z+crO33DN5UZi9/aUz1evXF6bars16U5mry9fmerVx7QWRNczVZHFiysWeSbLYtdfQ73a7MT19hFFk6Mho7Fo6+txWG9N1g0mSUANzbZU581wU0yCYWxjaMcsyzlnTNK0x1o7WjGMUhF0QRX0/9J0Zxq6qqv5qvWquL1eVGdpqsCFmq6pykVVlljd9YLvlXtmdHOx1bTv2w9h3681qePnyxfDVV2fjWG2Gvdsn4+07e+P77/9PvQ3HPtgOfRj2/cVFx/pfh2fJveFodTT+7d+mw2r1bPziCzN8+unDkYf/9jJ9qd4+4ve9BX5HC/Cvxi/eAt4C3gLeAt4C3gLeAt4C3zIL/AZezLAqGzx5AqzeBVZ/9qvg+Pi2NWkS9LdC'            }

            Component.onCompleted: {
                boing.setRandomColor();
            }

            SequentialAnimation on x {
                loops: Animation.Infinite
                PropertyAnimation {
                    easing.type: Easing.Linear
                    duration: 1920 * 11
                    to: 1920 - boing.width
                }

                ScriptAction { script: boing.setRandomColor(); }
                PropertyAnimation {
                    easing.type: Easing.Linear
                    duration: 1920 * 11
                    to: 0
                }
                ScriptAction { script: boing.setRandomColor(); }
            }

            SequentialAnimation on y {
                loops: Animation.Infinite
                PropertyAnimation {
                    easing.type: Easing.Linear
                    duration: 1080 * 7
                    to: 1080 - boing.height
                }
                ScriptAction { script: boing.setRandomColor(); }
                PropertyAnimation {
                    easing.type: Easing.Linear
                    duration: 1080 * 7
                    to: 0
                }
                ScriptAction { script: boing.setRandomColor(); }
            }
        }
    }
}
