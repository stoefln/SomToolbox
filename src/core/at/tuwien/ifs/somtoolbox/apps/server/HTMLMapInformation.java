/*
 * Copyright 2004-2010 Information & Software Engineering Group (188/1)
 *                     Institute of Software Technology and Interactive Systems
 *                     Vienna University of Technology, Austria
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.ifs.tuwien.ac.at/dm/somtoolbox/license.html
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package at.tuwien.ifs.somtoolbox.apps.server;

/**
 * @author Rudolf Mayer
 * @version $Id: HTMLMapInformation.java 3358 2010-02-11 14:35:07Z mayer $
 */
public class HTMLMapInformation {
    private String imageMap;

    private String imagePath;

    private String[] nNearest;

    public HTMLMapInformation(String imagePath, String imageMap, String[] nNearest) {
        this.imageMap = imageMap;
        this.imagePath = imagePath;
        this.nNearest = nNearest;
    }

    public HTMLMapInformation(String imagePath, String imageMap) {
        this(imagePath, imageMap, null);
    }

    public String getImageMap() {
        return imageMap;
    }

    public String getImagePath() {
        return imagePath;
    }

    public String[] getNNearest() {
        return nNearest;
    }

}
