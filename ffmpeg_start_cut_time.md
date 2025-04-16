## To cut based on start and end time from the source video and avoid having to do math
## specify the end time as the input option and the start time as the output option 

`ffmpeg -t 1:00 -i input.mpg -ss 45 output.mpg` 

#### This will produce a 15 second cut from 0:45 to 1:00.

#### This is because when -ss is given as an output option, the discarded time is still included in the total time read from the input 
#### which -t uses to know when to stop. Whereas if -ss is given as an input option, the start time is seeked and not counted, which is where the confusion comes from 

#### It's slower than seeking since the omitted segment is still processed before being discarded, but this is the only way to do it as far as I know
#### If you're clipping from deep within a large file, it's more prudent to just do the math and use -ss for the input
