# simulate 

Simulate your project flutter on cross platform with frame device ( android , ios, desktop ) on your os without heavy vm

## Demo 

![Screenshot from 2022-06-13 06-29-30](https://user-images.githubusercontent.com/82513502/173258012-cc84255e-4b09-4db6-b988-30a10c3be1fd.png)



https://user-images.githubusercontent.com/82513502/173173590-9b3a4d3e-484b-4508-baf8-9bd8cb49b35f.mp4


# For Windows apps

Inside your application folder, go to `windows\runner\main.cpp` and add these two lines at the beginning of the file:

```cpp
#include <bitsdojo_window_windows/bitsdojo_window_plugin.h>
auto bdw = bitsdojo_window_configure(BDW_CUSTOM_FRAME | BDW_HIDE_ON_STARTUP);
```

# For macOS apps

Inside your application folder, go to `macos\runner\MainFlutterWindow.swift` and add this line after the one saying `import FlutterMacOS` :

```swift
import FlutterMacOS
import bitsdojo_window_macos // Add this line
```

Then change this line from:

```swift
class MainFlutterWindow: NSWindow {
```
to this:
```swift
class MainFlutterWindow: BitsdojoWindow {
```
After changing `NSWindow` to `BitsdojoWindow` add these lines below the line you changed:
```swift
override func bitsdojo_window_configure() -> UInt {
  return BDW_CUSTOM_FRAME | BDW_HIDE_ON_STARTUP
}
```
Your code should now look like this:
```swift
class MainFlutterWindow: BitsdojoWindow {
    
  override func bitsdojo_window_configure() -> UInt {
    return BDW_CUSTOM_FRAME | BDW_HIDE_ON_STARTUP
  }
    
  override func awakeFromNib() {
    ... //rest of your code
```
#
If you don't want to use a custom frame and prefer the standard window titlebar and buttons, you can remove the `BDW_CUSTOM_FRAME` flag from the code above.
If you don't want to hide the window on startup, you can remove the `BDW_HIDE_ON_STARTUP` flag from the code above.
# For Linux apps
Inside your application folder, go to `linux\my_application.cc` and add this line at the beginning of the file:
```cpp
#include <bitsdojo_window_linux/bitsdojo_window_plugin.h>
```
Then look for these two lines:
```cpp
gtk_window_set_default_size(window, 1280, 720);
gtk_widget_show(GTK_WIDGET(window));
```
and change them to this:
```cpp
auto bdw = bitsdojo_window_from(window);            // <--- add this line
bdw->setCustomFrame(true);                          // <-- add this line
//gtk_window_set_default_size(window, 1280, 720);   // <-- comment this line
gtk_widget_show(GTK_WIDGET(window));
```
As you can see, we commented the line calling `gtk_window_set_default_size` and added these two lines before `gtk_widget_show(GTK_WIDGET(window));`
```cpp
auto bdw = bitsdojo_window_from(window);
bdw->setCustomFrame(true);
```