import { App, Astal, Gtk, Gdk, Widget } from "astal/gtk4"
import { Variable } from "astal"

const time = Variable("").poll(1000, "date")

export default function Bar(gdkmonitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

  return <window
    visible
    cssClasses={["Bar"]}
    gdkmonitor={gdkmonitor}
    exclusivity={Astal.Exclusivity.EXCLUSIVE}
    anchor={TOP | LEFT | RIGHT}
    application={App}>
    <centerbox cssName="centerbox">
      <button
        onClicked="echo hello"
        hexpand
        halign={Gtk.Align.CENTER}
      >
        Welcome to AGS!, marvin aba.
      </button>
      <box />
      <menubutton
        hexpand
        halign={Gtk.Align.CENTER}
      >
        <label label={time()} />
        <popover>
          <Gtk.Calendar />
        </popover>
      </menubutton>
      <MyButton />
    </centerbox>
  </window>
}

function MyButton(): Widget.Button {
  return Widget.Button(
    { onClicked: "echo hello" },
    Widget.Label({ label: "Click me!" }),
  )
}
