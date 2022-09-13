#  AstroImage

## Contents

1. [Prerequisites](https://github.com/romanzuch/AstroImage#prerequisites)
2. [API](https://github.com/romanzuch/AstroImage#api)
    1. [Query Parameters](https://github.com/romanzuch/AstroImage#query-parameters)
3. [Wireframes](https://github.com/romanzuch/AstroImage#wireframes)
4. [Mockups](https://github.com/romanzuch/AstroImage#mockups)

## Prerequisites

* Xcode 13.4.1 (13F100)
* Swift 5.6.1 
* iOS 15

## API

I'm using an API provided by the National Aeronautics and Space Administration (NASA) named [APOD (Astronomy Picture of the Day)](https://api.nasa.gov/). This API can be used to retrive the current and historic astronomy pictures. The API's full documentation can be found in their [Github repository](https://github.com/nasa/apod-api).

On NASA's API documentation it states:

> One of the most popular websites at NASA is the Astronomy Picture of the Day. In fact, this website is one of the most popular websites across all federal agencies. It has the popular appeal of a Justin Bieber video. This endpoint structures the APOD imagery and associated metadata so that it can be repurposed for other applications. In addition, if the concept_tags parameter is set to True, then keywords derived from the image explanation are returned. These keywords could be used as auto-generated hashtags for twitter or instagram feeds; but generally help with discoverability of relevant imagery.

### Query Parameters

| Parameter  | Type       | Default  | Description                                                                                                                           |
|------------|------------|----------|---------------------------------------------------------------------------------------------------------------------------------------|
| date       | YYYY-MM-DD | today    | The date of the APOD image to retrieve.    **The date must be between Jun 16, 1995 and Sep 13, 2022.**                                |
| start_date | YYYY-MM-DD | none     | The start of a date range, when requesting date for a range of dates. Cannot be used with  `date`.                                    |
| end_date   | YYYY-MM-DD | today    | The end of the date range, when used with `start_date`.                                                                               |
| count      | int        | none     | If this is specified then `count` randomly chosen images will be returned. Cannot be used with `date` or `start_date` and `end_date`. |
| thumbs     | bool       | False    | Return the URL of video thumbnail. If an APOD is not a video, this parameter is ignored.                                              |
| api_key    | string     | DEMO_KEY | api.nasa.gov key for expanded usage                                                                                                   |

## Wireframes

![wireframes](https://raw.githubusercontent.com/romanzuch/AstroImage/main/220913_Basic_Wireframes.png)

## Mockups

### Basic mockups
![mockups](https://github.com/romanzuch/AstroImage/blob/main/MockUps.png)

### Mockups with additional information
![mockups with additional screen to show image description](https://github.com/romanzuch/AstroImage/blob/main/MockUps_2.png)
