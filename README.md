# PD-path

This is my directory of Pure Data abstractions. Despite the name, I **highly recommend** using these abstractions with [Purr Data](https://agraef.github.io/purr-data-intro/Purr-Data-Intro.html) rather than [Pure Data](https://puredata.info/). There's a lot of features that would be broken if you tried using them in stock Pure Data.

I try my best to label everything so newcomers can understand what's going on. But still, there's a lot of content that's hard to explain. If you're confused about anything, PLEASE message me or open an issue or a pull request. I'm trying to make this as approachable as possible.

Keep in mind that nothing here is final. I often change my mind on what these abstractions should be called. Sometimes I change my mind on the entirety of how these abstractions should work. Know that everything in this repository can **and will** change over time.

## Custom Terminology

One of the most annoying things while making these was seeing community-made PD files with zero explanation for what's actually happening inside the file. They're often unsorted and use words and dependencies I could never understand. I'm no exception. Throughout these patches, I use a lot of made up words. So here, I'll try to simplify some of the terms.

### `lslider`
**"Linear Slider"** — This is a slider that outputs numbers in the range of 0 to 127. This is by far the most common slider you'll see in these patches.

### `mslider`
**"Middle Slider"** — This slider also ranges from 0 to 127, but the 'head' is expected to rest at 64 (halfway through the range). This is ideal for situations where you want a slider that can go up or down from the center.

### `pbend`
**"Pitch Bend"** — For whatever reason, pitch-bend data ranges 0 to 16,383 instead of 0 to 127. So I had to come up with a custom naming scheme for it.

## Feedback & Contributing

A lot of this code is mushed together from Pure Data forums. I try to give credit, but sometimes I forget. If you find any code that’s yours, let me know and I'll credit you.

This project is licensed under [the Unlicense](https://unlicense.org/), so you’re entirely free to do whatever you want with it. However, I’d still love to see how you’re using it! If you make something cool, share it with me or make a pull request.
