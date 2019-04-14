# RateBar
 Can used it for show rating for some staff.<br />
 Make user set rate for something.<br />



# Let's start first by install cocoaPod
 
   cd to your project folder 
   ```
   pod init
   ```
   Add to pod file for your target
   ```
   pod 'RateBar'
   ```
   ```
   run pod update , or pod install
   ```


## How to used it :
Rating bar for iOS platform it is easy to use 

1- Drag view in storyBorad, change it to (*RatingBar)

2- Create outlet of this class
```
    @IBOutlet weak var ratingbar: RatingBar!
```
3- you can confirm protocal to listen to change in rate value.
```
RatingBarDelegate
func RatingBar(_ ratingBar: RatingBar, didChangeValue value: Int) {
        print(value)
    }
 ```
4- set rate value by  #  .rateValue
```
        ratingbar.setRatingValue(rateValue: <#T##Double#>)
```


 ![alt tag](https://github.com/ragaie/RateBar/blob/master/Screen%20Shot%202017-11-06%20at%207.23.36%20PM.png)
 ![alt tag](https://github.com/ragaie/RateBar/blob/master/Screen%20Shot%202017-11-15%20at%201.56.50%20PM.png)

# you can set value or used to get user value 
 ![alt tag](https://github.com/ragaie/RateBar/blob/master/Screen%20Shot%202017-11-06%20at%206.51.17%20PM.png)

# result it should be : --

 ![alt tag](https://github.com/ragaie/RateBar/blob/master/Screen%20Shot%202017-11-06%20at%206.54.25%20PM.png)



## Author

* **Ragaie alfy Fahmey**  - [ragaie](https://github.com/ragaie)

## You can find me in linked in:- 
- [Ragaie alfy](www.linkedin.com/in/ragaie-alfy)


# MIT License

Copyright (c) 2017 ragaie alfy fahmey

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
