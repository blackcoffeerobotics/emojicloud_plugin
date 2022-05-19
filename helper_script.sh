#!/bin/bash

# Ask user to input the name of the emoji
echo "Enter the name of the emoji:"
read emoji

# Ask user to input the emoji
echo "Paste your emoji here:"
read emoji_code

# material changes
cd shaders && cp point_cloud_poo_emoji.material point_cloud_${emoji}_emoji.material
sed -i "s/PointCloudPooEmoji/PointCloud${emoji^}Emoji/g" point_cloud_${emoji}_emoji.material
sed -i "s/poo.png/${emoji}.png/g" point_cloud_${emoji}_emoji.material

# point cloud header changes
cd ../src
sed -i '/RM_POO_EMOJI/a \\t\t\RM_'"${emoji^^}"'_EMOJI,' point_cloud.h
sed -i '/Ogre::MaterialPtr poo_emoji_material_;/a \\t\Ogre::MaterialPtr '"${emoji}"'_emoji_material_;' point_cloud.h

# point cloud source changes
sed -i '/emojicloud_plugin\/PointCloudPooEmoji/a \\t'"${emoji}"'_emoji_material_ = Ogre::MaterialManager::getSingleton().getByName(\n\t\t\t"emojicloud_plugin\/PointCloud'"${emoji^}"'Emoji");' \
    point_cloud.cpp
sed -i '/ss.str() + "PooEmoji"/a \\t'"${emoji}"'_emoji_material_ = \n\t\t\tOgre::MaterialPtr('"${emoji}"'_emoji_material_)->clone(ss.str() + "'"${emoji^}"'Emoji");' \
    point_cloud.cpp

sed -i '/poo_emoji_material_->load();/a \\t'"${emoji}"'_emoji_material_->load();' point_cloud.cpp
sed -i '/poo_emoji_material_->unload();/a \\t'"${emoji}"'_emoji_material_->unload();' point_cloud.cpp
sed -i '/removeMaterial(poo_emoji_material_);/a \\tremoveMaterial('"${emoji}"'_emoji_material_);' point_cloud.cpp

sed -i '/current_material_ = Ogre::MaterialPtr(poo_emoji_material_);/a \\t\} else if (mode == RM_'"${emoji^^}"'_EMOJI) {\n\t\tcurrent_material_ = Ogre::MaterialPtr('"${emoji}"'_emoji_material_);' \
    point_cloud.cpp

sed -i '/setAlphaBlending(poo_emoji_material_);/a \\t\t\setAlphaBlending('"${emoji}"'_emoji_material_);' point_cloud.cpp
sed -i '/setReplace(poo_emoji_material_);/a \\t\t\setReplace('"${emoji}"'_emoji_material_);' point_cloud.cpp

sed -i '/else if (render_mode_ == RM_POO_EMOJI)/!{p;d;};n;a \\t\t\} else if (render_mode_ == RM_'"${emoji^^}"'_EMOJI) {\n\t\t\tvertices = g_billboard_vertices;' \
    point_cloud.cpp
sed -i '/  if (render_mode_ == RM_POO_EMOJI)/!{p;d;};n;n;a \\n\t\if (render_mode_ == RM_'"${emoji^^}"'_EMOJI) {\n\t\treturn 6;\n\t}' \
    point_cloud.cpp

# point cloud common changes
sed -i '/style_property_->addOption("Poo 💩", PointCloud::RM_POO_EMOJI);/a \\t\style_property_->addOption("'"${emoji^}"' '"${emoji_code}"'", PointCloud::RM_'"${emoji^^}"'_EMOJI);' \
    point_cloud_common.cpp
