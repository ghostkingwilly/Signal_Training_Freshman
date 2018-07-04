# Channel from Signal

## Shape of signal

* signal information
    * chap 2 ppt - 12~14
    * band-pass signal
* wiki
    * https://en.wikipedia.org/wiki/Communication_channel
    * https://en.wikipedia.org/wiki/Channel_state_information
    * 02_channels
        * page 10
---

## What is channel

* channel components
    * linear channel
    * y(t) = Kx(t-t_d)
    * y(f) = F[y(t)] = Kexp(j\omega t_d)X(f) 
    * \omega = 2\pi f

---
## Where is chennal

* example code

---

## Some problems

* phase delay
    * https://ccrma.stanford.edu/~jos/fp/Phase_Delay.html
    * http://www.sengpielaudio.com/calculator-timedelayphase.htm
    * 在 time domain 上的 delay 就是 freq. domain 上的 phase shift
    * 先解釋圖，再來是公式

* [channel fading](https://en.wikipedia.org/wiki/Fading)

    * large scale and small scale
    * Coherence time is the time duration over which the channel impulse response is considered to be not varying.
    * doppler shift and spread
    * relation
    * for fast and slow

    * coherence bandwidth
    * delay spread
    * flat and freq. selective fading
* large scale -> path loss -> Friis

* path loss
    * https://en.wikipedia.org/wiki/Path_loss
    * https://www.utdallas.edu/~torlak/courses/ee4367/lectures/lectureradio.pdf
    * Friis Transmission Formula
