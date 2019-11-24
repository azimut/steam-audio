# steam-audio

**WORK IN PROGRESS**

Lisp bindings of Valve's [steam-audio](https://valvesoftware.github.io/steam-audio/) library.

## Usage

See the official C API [docs](https://valvesoftware.github.io/steam-audio/doc/capi/index.html).

Someone said at https://steamcommunity.com/app/596420/discussions/0/133258092241659810/#c133258092249112926
``` text
Phonon actually does not manage your audio sources in the scene and it
does not load any audio files or play them on its own. You have to
integrate it into another audio engine.

In my case, I use SDL_mixer and simply load and play my sounds as normal
for every audio source. This results in all the sounds being played with
no 3D audio applied.

To use Phonon, you have to manually apply the effects that you want to
each audio source seperately in each audio frame. To do so, first create
the renderers and effect you need for every audio source.

Then, for example, in SDL_mixer I can specify a callback function that
gets called every time an audio frame is being played and lets me change
the raw audio samples any way I want. Here, I convert the data from
SDL_mixer to a IPLAudioBuffer, which I can apply my effects on, for
example by calling iplApplyBinauralEffect. Then, I convert the
IPLAudioBuffer back to what my audio engine needs and return it.
```

## License

MIT

