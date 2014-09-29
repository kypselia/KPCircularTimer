# KPCircularTimer

KPCircularTimer is an IBDesignable component that creates a custom circular timer, showing the percentage completed since start.

## Installation
===

Drop the files `KPCircularTimer.h` and `KPCircularTimer.m` into your Xcode project.

## Usage
===

In your Storyboard, add a UIView to your scene, set its class to KPCircularTimer and configure its properties in the Attributes pane. You will in particular want to configure the background and foreground colors for your timer view to be visible. 

In your View Controller class, set the `timeToRun` property to the duration of the timer, then call the `start` method to start the timer. You may also configure block callbacks to be executed at the start and end of the timer. 

## Methods
===

Create a timer using:

```
- (id)initWithTimeInterval:(NSTimeInterval)timeToRun 
                  position:(CGPoint)position 
                    radius:(CGFloat)radius 
               strokeWidth:(CGFloat)strokeWidth 
     backgroundStrokeColor:(UIColor *)backgroundStrokeColor 
     foregroundStrokeColor:(UIColor *)foregroundStrokeColor 
             startCallback:(void (^)(void))startBlock 
               endCallback:(void (^)(void))endBlock;
```

```
- (void)start;
```
Starts the timer.

```
- (void)stop;
```
Stops the timer.

```
- (void)pause;
```
Pauses the timer.

```
- (void)resume;
```
Resumes the timer.

```
- (BOOL)isRunning;
```
Indicates if the timer is currently running.

```
- (NSTimeInterval)elapsedTime;
```
Returns the interval of time elapsed since the timer started running.


## Demo

You can find a demo project in this repository. 

## About us
===

##### KYPSELIA

[@kypselia](http://twitter.com/kypselia)

[http://kypselia.com/](http://kypselia.com/)

[http://facebook.com/kypselia](http://facebook.com/kypselia)


## Licence
===
  
Copyright (C) 2014 KYPSELIA. 
Partly based on code from CROWD STUDIO, copyright (C) 2013 CROWD STUDIO

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

