# Emoji Cloud Plugins

A ROS1 RViz plugin to display emojis in LaserScans and PointClouds.

<img src="https://user-images.githubusercontent.com/45683974/169244539-93c6394a-f624-4134-9c9e-21ab73bb315c.gif" width="900" height="500"/>

## Usage

This plugin proves to be very useful for differentiating between multiple pointclouds.

For instance, one can use 😎 to identify a very accurate pointcloud, or use 💩 to identify a pointcloud with a lot of noise.

## Installation

* To build this package independently:

	  catkin build emojicloud_plugin

## Tutorial

Following are the instructions of adding your very own emoji:

* Add your `.png` image rotated clockwise by 90° to `shaders/emojis` directory.

* Run the helper script, and input your emoji name and paste your emoji as well:

	  ./helper_script.sh

	Build your package once you've added your set of emojis.

## Credits

We would like to thank [u/MoffKalast](https://www.reddit.com/r/ROS/comments/m668w4/has_science_gone_too_far/?utm_source=share&utm_medium=web2x&context=3) for giving us this wonderful idea and [surfel_cloud_rviz_plugin](https://github.com/RMonica/surfel_cloud_rviz_plugin) for the accurate package structure.
