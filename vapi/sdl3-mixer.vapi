/*
* Copyright (C) 2025 Italo Felipe Capasso Ballesteros <italo@gp-mail.com>
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"),
* regardless of their gender, ethnicity or political affiliation, to deal in
* the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, and/or distribute copies of the
* Software, and to permit persons to whom the Software is furnished to do so,
* subject to the following conditions:
*
* 1. The origin of the Software must not be misrepresented; you must not
*    claim that you wrote the original Software. If you use this software
*    in a product, an acknowledgment in the product documentation would be
*    appreciated but is not required.
*
* 2. Altered source versions must be plainly marked as such, and must not be
*    misrepresented as being the original Software.
*
* 3. You and your company, unequivocally support the principles and ethos of
*    Inclusion, Diversity, and Equity (IDE or DEI), and reject any and all
*    kinds of bigotry, cruelty or discrimination anyplace.
*
* 4. You and your company, support the Contributor Covenant
*    (https://www.contributor-covenant.org) or any Code of Conduct or company
*    policy that is similar or compatible, and upholds the same spirit.
*
* 5. The Software and any modifications made to it may not be used for the
*    purpose of training or improving machine learning algorithms, including
*    but not limited to artificial intelligence, natural language processing,
*    or data mining. This condition applies to any derivatives, modifications,
*    or updates based on the Software code. Any usage of the Software in an
*    AI-training dataset is considered a breach of this License.
*
* 6. The Software may not be included in any dataset used for training or
*    improving machine learning algorithms, including but not limited to
*    artificial intelligence, natural language processing, or data mining.
*
* 7. You and your company, in adition to these conditions, also agree to use
*    the Software by abiding the terms of the "Polyform Small Business
*    License" (https://polyformproject.org/licenses/small-business/1.0.0/).
*
* 8. The above copyright notice and this permission notice shall be included
*    in its entirety in all copies or substantial portions of the Software,
*    credits screen or "about" page included.
*
* 9. Any person or organization found to be in violation of these restrictions
*    will be subject to legal action and may be held liable for any damages
*    resulting from such use.
*
* 10. This notice may not be removed or altered from any source distribution.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Author: Italo Felipe Capasso Ballesteros <italo@gp-mail.com>
*/

/*
 * The API order goes by the category classification expressed in the docs
 * https://wiki.libsdl.org/SDL3_mixer/CategorySDLMixer
 */

/**
 * The SDL3 Mixer Library Vala bindings.
 *
 * SDL_mixer is a library to make complicated audio processing tasks easier.
 * It offers audio file decoding, mixing multiple sounds together, basic 3D
 * positional audio, and various audio effects.
 * It can mix sound to multiple audio devices in real time, or generate mixed
 * audio data to a memory buffer for any other use. It can do both at the same
 * time!
 *
 *  * [[https://wiki.libsdl.org/SDL3_mixer/]]
 */
[CCode (cheader_filename = "SDL3_mixer/SDL_mixer.h")]
namespace SDL.Mixer {
    /**
     * Convert sample frames for a {@link Audio}'s format to milliseconds.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_AudioFramesToMS]]
     *
     * @param audio the audio to query.
     * @param frames the audio-specific sample frames to convert to
     * milliseconds.
     *
     * @return Converted number of milliseconds, or -1 for errors/no input;
     * call {@link SDL.Error.get_error} for details.
     *
     * @since 3.0.0
     *
     * @see audio_ms_to_frames
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_AudioFramesToMS")]
    public static int64 audio_frames_to_ms (Audio audio, int64 frames);

    /**
     * Convert milliseconds to sample frames for a {@link Audio}'s format.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_AudioMSToFrames]]
     *
     * @param audio the audio to query.
     * @param ms the milliseconds to convert to audio-specific sample frames.
     *
     * @return Converted number of milliseconds, or -1 for errors/no input;
     * call {@link SDL.Error.get_error} for details.
     *
     * @since 3.0.0
     *
     * @see audio_frames_to_ms
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_AudioMSToFrames")]
    public static int64 audio_ms_to_frames (Audio audio, int64 ms);

    /**
     * Create a {@link AudioDecoder} from a path on the filesystem.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_CreateAudioDecoder]]
     *
     * @param path the path on the filesystem from which to load data.
     * @param props decoder-specific properties. May be zero.
     *
     * @return an audio decoder, ready to decode.
     *
     * @since 3.0.0
     *
     * @see create_audio_decoder_io
     * @see decode_audio
     * @see destroy_audio_decoder
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_CreateAudioDecoder")]
    public static AudioDecoder create_audio_decoder (string path,
            SDL.Properties.PropertiesID props);

    /**
     * Create a {@link AudioDecoder} from a path on the filesystem.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_CreateAudioDecoder_IO]]
     *
     * @param io the i/o stream from which to load data.
     * @param close_io if true, close the i/o stream when done with it.
     * @param props decoder-specific properties. May be zero.
     *
     * @return an audio decoder, ready to decode.
     *
     * @since 3.0.0
     *
     * @see create_audio_decoder
     * @see decode_audio
     * @see destroy_audio_decoder
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_CreateAudioDecoder_IO")]
    public static AudioDecoder * create_audio_decoder_io (SDL.IOStream.IOStream io,
            bool close_io,
            SDL.Properties.PropertiesID props);

    /**
     * Create a mixing group.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_CreateGroup]]
     *
     * @param mixer the mixer on which to create a mixing group.
     *
     * @return a newly-created mixing group, or null on error; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see destroy_group
     * @see set_track_group
     * @see set_group_post_mix_callback
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_CreateGroup")]
    public static Group create_group (Mixer mixer);

    /**
     * Create a mixer that generates audio to a memory buffer.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_CreateMixer]]
     *
     * @param spec the audio format that mixer will generate.
     *
     * @return a mixer that can be used to generate audio, or null on
     * failure; call {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see create_mixer_device
     * @see destroy_mixer
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_CreateMixer")]
    public static Mixer create_mixer (SDL.Audio.AudioSpec spec);

    /**
     * Create a mixer that plays sound directly to an audio device.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_CreateMixerDevice]]
     *
     * @param dev_id the device to open for playback, or
     * {@link SDL.Audio.AUDIO_DEVICE_DEFAULT_PLAYBACK} for the default.
     * @param spec the audio format that mixer will generate. May be null.
     *
     * @return a mixer that can be used to play audio, or null on failure;
     * call {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see create_mixer
     * @see destroy_mixer
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_CreateMixerDevice")]
    public static Mixer create_mixer_device (SDL.Audio.AudioDeviceID dev_id, SDL.Audio.AudioSpec ? spec);

    /**
     * Create a {@link Audio} that generates a sinewave.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_CreateSineWaveAudio]]
     *
     * @param mixer a mixer this audio is intended to be used with.
     * May be null.
     * @param hz the sinewave's frequency in Hz.
     * @param amplitude the sinewave's amplitude from 0.0f to 1.0f.
     * @param ms the maximum number of milliseconds of audio to generate, or
     * less than zero to generate infinite audio.
     *
     * @return an audio object that can be used to make sound on a mixer,
     * or null on failure; call {@link SDL.Error.get_error} for more
     * information.
     *
     * @since 3.0.0
     *
     * @see destroy_audio
     * @see set_track_audio
     * @see load_audio_io
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_CreateSineWaveAudio")]
    public static Audio create_sine_wave_audio (Mixer? mixer, int hz, float amplitude, int64 ms);

    /**
     * Create a new track on a mixer.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_CreateTrack]]
     *
     * @param mixer the mixer on which to create this track.
     *
     * @return a new {@link Track} on success, null on error; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see destroy_track
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_CreateTrack")]
    public static Track create_track (Mixer mixer);

    /**
     * Create a new track on a mixer.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_DecodeAudio]]
     *
     * @param audio_decoder the decoder from which to retrieve more data.
     * @param buffer the memory buffer to store decoded audio.
     * @param buffer_length the maximum number of bytes to store to buffer.
     * @param spec the format that audio data will be stored to buffer.
     *
     * @return number of bytes decoded, or -1 on error; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see destroy_track
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_DecodeAudio")]
    public static int decode_audio (AudioDecoder audio_decoder,
            void *buffer,
            int buffer_length,
            SDL.Audio.AudioSpec spec);

    /**
     * Destroy the specified audio.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_DestroyAudio]]
     *
     * @param audio the audio to destroy.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_DestroyAudio")]
    public static void destroy_audio (Audio audio);

    /**
     * Destroy the specified audio decoder.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_DestroyAudioDecoder]]
     *
     * @param audio_decoder the audio decoder to destroy.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_DestroyAudioDecoder")]
    public static void destroy_audio_decoder (AudioDecoder audio_decoder);

    /**
     * Destroy a mixing group.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_DestroyGroup]]
     *
     * @param group the mixing group to destroy.
     *
     * @since 3.0.0
     *
     * @see create_group
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_DestroyGroup")]
    public static void destroy_group (Group group);

    /**
     * Destroy a mixer.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_DestroyMixer]]
     *
     * @param mixer the mixer to destroy.
     *
     * @since 3.0.0
     *
     * @see create_mixer_device
     * @see create_mixer
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_DestroyMixer")]
    public static void destroy_mixer (Mixer mixer);

    /**
     * Destroy the specified track.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_DestroyTrack]]
     *
     * @param track the track to destroy.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_DestroyTrack")]
    public static void destroy_track (Track track);

    /**
     * Convert sample frames, at a specific sample rate, to milliseconds.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_FramesToMS]]
     *
     * @param sample_rate the sample rate to use for conversion.
     * @param frames the rate-specific sample frames to convert to
     * milliseconds.
     *
     * @return converted number of milliseconds, or -1 for errors;
     * call {@link SDL.Error.get_error} for details.
     *
     * @since 3.0.0
     *
     * @see ms_to_frames
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_FramesToMS")]
    public static int64 frames_to_ms (int sample_rate, int64 frames);

    /**
     * Generate mixer output when not driving an audio device.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_Generate]]
     *
     * @param mixer the mixer for which to generate more audio.
     * @param buffer pointer to a buffer to store audio in.
     * @param buffer_length the number of bytes to store in buffer.
     *
     * @return the number of bytes of mixed audio, discounting appended
     * silence, on success, or -1 on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see create_mixer
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_Generate")]
    public static int generate (Mixer mixer, void *buffer, int buffer_length);

    /**
     * Generate mixer output when not driving an audio device.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetAudioDecoder]]
     *
     * @param index he index of the decoder to query.
     *
     * @return a UTF-8 (really, ASCII) string of the decoder's name,
     * or null if index is invalid.
     *
     * @since 3.0.0
     *
     * @see get_num_audio_decoders
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_GetAudioDecoder")]
    public static string get_audio_decoder (int index);

    /**
     * Generate mixer output when not driving an audio device.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetAudioDecoder]]
     *
     * @param audio_decoder the audio decoder to query.
     * @param spec on success, audio format details will be stored here.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see get_num_audio_decoders
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_GetAudioDecoderFormat")]
    public static bool get_audio_decoder_format (AudioDecoder audio_decoder,
            out SDL.Audio.AudioSpec spec);

    /**
     * Get the properties associated with an {@link AudioDecoder}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetAudioDecoderProperties]]
     *
     * @param audio_decoder the audio decoder to query.
     *
     * @return a valid property ID on success or 0 on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see get_audio_properties
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_GetAudioDecoderProperties")]
    public static SDL.Properties.PropertiesID get_audio_decoder_properties (AudioDecoder audio_decoder);

    /**
     * Get the length of a {@link Audio}'s playback in sample frames.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetAudioDuration]]
     *
     * @param audio the audio to query.
     *
     * @return the length of the audio in sample frames, or
     * {@link Duration.UNKNOWN} or {@link Duration.INFINITE}.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_GetAudioDuration")]
    public static int64 get_audio_duration (Audio audio);

    /**
     * Query the initial audio format of an {@link Audio}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetAudioFormat]]
     *
     * @param audio the audio to query.
     * @param spec on success, audio format details will be stored here.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_GetAudioFormat")]
    public static bool get_audio_format (Audio audio, out SDL.Audio.AudioSpec spec);

    /**
     * Get the properties associated with an {@link Audio}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetAudioProperties]]
     *
     * @param audio the audio to query.
     *
     * @return a valid property ID on success or 0 on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_GetAudioProperties")]
    public static SDL.Properties.PropertiesID get_audio_properties (Audio audio);

    /**
     * Get the {@link Mixer} that owns a {@link Group}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetGroupMixer]]
     *
     * @param group the group to query.
     *
     * @return the mixer associated with the group, or null on error; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_GetGroupMixer")]
    public static Mixer get_group_mixer (Group group);

    /**
     * Get the properties associated with a group.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetGroupProperties]]
     *
     * @param group the group to query.
     *
     * @return a valid property ID on success or 0 on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_GetGroupProperties")]
    public static SDL.Properties.PropertiesID get_group_properties (Group group);

    /**
     * Get a mixer's master gain control.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetMixerGain]]
     *
     * @param mixer the mixer to query.
     *
     * @return the last value set through {@link set_mixer_gain}, or 1.0f
     * if no value has ever been explicitly set.
     *
     * @since 3.0.0
     *
     * @see set_mixer_gain
     * @see get_track_gain
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_GetMixerGain")]
    public static float get_mixer_gain (Mixer mixer);

    /**
     * Get the audio format a mixer is generating.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetMixerFormat]]
     *
     * @param mixer the mixer to query.
     * @param spec where to store the mixer audio format.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_GetMixerFormat")]
    public static bool get_mixer_format (Mixer mixer, out SDL.Audio.AudioSpec spec);

    /**
     * Get the properties associated with a mixer.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetMixerProperties]]
     *
     * @param mixer the mixer to query.
     *
     * @return a valid property ID on success or 0 on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_GetMixerProperties")]
    public static SDL.Properties.PropertiesID get_mixer_properties (Mixer mixer);

    /**
     * Report the number of audio decoders available for use.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetNumAudioDecoders]]
     *
     * @return the number of decoders available.
     *
     * @since 3.0.0
     *
     * @see get_audio_decoder
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_GetNumAudioDecoders")]
    public static int get_num_audio_decoders ();

    /**
     * Get all tracks with a specific tag.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetTaggedTracks]]
     *
     * @param mixer the mixer to query.
     * @param tag the tag to search.
     *
     * @return an array of the tracks, null-terminated, or null on failure;
     * call {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_GetTaggedTracks")]
    public static Track[] ? get_tagged_tracks (Mixer mixer, string tag);

    /**
     * Get a track's current position in 3D space.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetTrack3DPosition]]
     *
     * @param track the track to query.
     * @param position on successful return, will contain the track's position.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see set_track_3d_position
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_GetTrack3DPosition")]
    public static bool get_track_3d_position (Track track, out Point3D position);

    /**
     * Query the {@link Audio} assigned to a track.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetTrackAudio]]
     *
     * @param track the track to query.
     *
     * @return a {@link Audio} if available, null if not.
     *
     * @since 3.0.0
     *
     * @see get_track_audio_stream
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_GetTrackAudio")]
    public static Audio get_track_audio (Track track);

    /**
     * Query the {@link SDL.Audio.AudioStream} assigned to a track.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetTrackAudioStream]]
     *
     * @param track the track to query.
     *
     * @return an {@link SDL.Audio.AudioStream} if available,, null if not.
     *
     * @since 3.0.0
     *
     * @see get_track_audio
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_GetTrackAudioStream")]
    public static SDL.Audio.AudioStream get_track_audio_stream (Track track);

    /**
     * Query whether a given track is fading.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetTrackFadeFrames]]
     *
     * @param track the track to query.
     *
     * @return less than 0 if the track is fading out, greater than 0 if
     * fading in, zero otherwise.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_GetTrackFadeFrames")]
    public static int64 get_track_fade_frames (Track track);

    /**
     * Query the frequency ratio of a track.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetTrackFrequencyRatio]]
     *
     * @param track the track to query.
     *
     * @return the current frequency ratio, or 0.0f on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_GetTrackFrequencyRatio")]
    public static float get_track_frequency_ratio (Track track);

    /**
     * Get a track's gain control.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetTrackGain]]
     *
     * @param track the track to query.
     *
     * @return the track's current gain.
     *
     * @since 3.0.0
     *
     * @see set_track_gain
     * @see get_mixer_gain
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_GetTrackGain")]
    public static float get_track_gain (Track track);

    /**
     * Query how many loops remain for a given track.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetTrackLoops]]
     *
     * @param track the track to query.
     *
     * @return the number of pending loops, zero if not looping, and -1 if
     * looping infinitely.
     *
     * @since 3.0.0
     *
     * @see set_track_loops
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_GetTrackLoops")]
    public static int get_track_loops (Track track);

    /**
     * Get the {@link Mixer} that owns a {@link Track}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetTrackMixer]]
     *
     * @param track the track to query.
     *
     * @return the mixer associated with the track, or null on error; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_GetTrackMixer")]
    public static Mixer get_track_mixer (Track track);

    /**
     * Get the current input position of a playing track.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetTrackPlaybackPosition]]
     *
     * @param track the track to query.
     *
     * @return the track's current sample frame position, or -1 on error;
     * call {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see set_track_playback_position
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_GetTrackPlaybackPosition")]
    public static int64 get_track_playback_position (Track track);

    /**
     * Get the properties associated with a track.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetTrackProperties]]
     *
     * @param track the track to query.
     *
     * @return a valid property ID on success or 0 on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_GetTrackProperties")]
    public static SDL.Properties.PropertiesID get_track_properties (Track track);

    /**
     * Return the number of sample frames remaining to be mixed in a track.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetTrackRemaining]]
     *
     * @param track the track to query.
     *
     * @return the total sample frames still to be mixed, or -1 if unknown.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_GetTrackRemaining")]
    public static int64 get_track_remaining (Track track);

    /**
     * Get the tags currently associated with a track.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetTrackTags]]
     *
     * @param track the track to query.
     *
     * @return an array of the tags, NULL-terminated, or NULL on failure;
     * call {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_GetTrackTags")]
    public static string[] ? get_track_tags (Track track);

    /**
     * Initialize the SDL_mixer library.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_Init]]
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see quit
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_Init")]
    public static bool init ();

    /**
     * Load audio for playback from a file.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_LoadAudio]]
     *
     * @param mixer a mixer this audio is intended to be used with. May
     * be null.
     * @param path the path on the filesystem to load data from.
     * @param pre_decode if true, data will be fully uncompressed before
     * returning.
     *
     * @return an audio object that can be used to make sound on a mixer,
     * or null on failure; call {@link SDL.Error.get_error} for more
     * information.
     *
     * @since 3.0.0
     *
     * @see destroy_audio
     * @see set_track_audio
     * @see load_audio_io
     * @see load_audio_with_properties
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_LoadAudio")]
    public static Audio load_audio (Mixer? mixer, string path, bool pre_decode);

    /**
     * Load audio for playback from an {@link SDL.IOStream.IOStream}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_LoadAudio_IO]]
     *
     * @param mixer a mixer this audio is intended to be used with.
     * May be null.
     * @param io the {@link SDL.IOStream.IOStream} to load data from.
     * @param pre_decode if true, data will be fully uncompressed before
     * returning.
     * @param close_io true if SDL_Mixer should close io before returning
     * (success or failure).
     *
     * @return an audio object that can be used to make sound on a mixer,
     * or null on failure; call {@link SDL.Error.get_error} for more
     * information.
     *
     * @since 3.0.0
     *
     * @see destroy_audio
     * @see set_track_audio
     * @see load_audio
     * @see load_audio_with_properties
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_LoadAudio_IO")]
    public static Audio load_audio_io (Mixer? mixer, SDL.IOStream.IOStream io, bool pre_decode, bool close_io);

    /**
     * Load audio for playback from a memory buffer without making a copy.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_LoadAudioNoCopy]]
     *
     * @param mixer a mixer this audio is intended to be used with. May
     * be null.
     * @param buffer the buffer where the audio data lives.
     * @param free_when_done if true, data will be given to SDL_free() when
     * the MIX_Audio is destroyed.
     *
     * @return an audio object that can be used to make sound on a mixer,
     * or null on failure; call {@link SDL.Error.get_error} for more
     * information.
     *
     * @since 3.0.0
     *
     * @see destroy_audio
     * @see set_track_audio
     * @see load_audio_io
     * @see load_audio_with_properties
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_LoadAudioNoCopy")]
    public static Audio load_audio_no_copy (Mixer? mixer, uint8[] buffer, bool free_when_done);
    /**
     * Load audio for playback through a collection of properties.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_LoadAudioWithProperties]]
     *
     * @param props a set of properties on how to load audio.
     *
     * @return an audio object that can be used to make sound on a mixer,
     * or null on failure; call {@link SDL.Error.get_error} for more
     * information.
     *
     * @since 3.0.0
     *
     * @see destroy_audio
     * @see set_track_audio
     * @see load_audio
     * @see load_audio_with_properties
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_LoadAudioWithProperties")]
    public static Audio load_audio_with_properties (SDL.Properties.PropertiesID props);

    /**
     * Load raw PCM data from a memory buffer.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_LoadRawAudio]]
     *
     * @param mixer a mixer this audio is intended to be used with.
     * May be null.
     * @param data the raw PCM data to load.
     * @param data_length the size, in bytes, of the raw PCM data.
     * @param spec what format the raw data is in.
     *
     * @return an audio object that can be used to make sound on a mixer,
     * or null on failure; call {@link SDL.Error.get_error} for more
     * information.
     *
     * @since 3.0.0
     *
     * @see destroy_audio
     * @see set_track_audio
     * @see load_raw_audio_io
     * @see load_raw_audio_no_copy
     * @see load_audio_io
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_LoadRawAudio")]
    public static Audio load_raw_audio (Mixer? mixer, void *data, size_t data_length,
            SDL.Audio.AudioSpec spec);

    /**
     * Load raw PCM data from an {@link SDL.IOStream.IOStream}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_LoadRawAudio_IO]]
     *
     * @param mixer a mixer this audio is intended to be used with.
     * May be null.
     * @param io the {@link SDL.IOStream.IOStream} to load data from.
     * @param spec what format the raw data is in.
     * @param close_io true if SDL_mixer should close io before returning
     * (success or failure).
     *
     * @return an audio object that can be used to make sound on a mixer,
     * or null on failure; call {@link SDL.Error.get_error} for more
     * information.
     *
     * @since 3.0.0
     *
     * @see destroy_audio
     * @see set_track_audio
     * @see load_raw_audio
     * @see load_raw_audio_no_copy
     * @see load_audio_io
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_LoadRawAudio_IO")]
    public static Audio load_raw_audio_io (Mixer? mixer,
            SDL.IOStream.IOStream io,
            SDL.Audio.AudioSpec spec,
            bool close_io);

    /**
     * Load raw PCM data from a memory buffer without making a copy.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_LoadRawAudioNoCopy]]
     *
     * @param mixer a mixer this audio is intended to be used with.
     * May be null.
     * @param data the buffer where the raw PCM data lives.
     * @param data_length the size, in bytes, of the raw PCM data.
     * @param spec what format the raw data is in.
     * @param free_when_done if true, data will be given to
     * {@link SDL.StdInc.free} when the {@link Audio} is destroyed.
     *
     * @return an audio object that can be used to make sound on a mixer,
     * or null on failure; call {@link SDL.Error.get_error} for more
     * information.
     *
     * @since 3.0.0
     *
     * @see destroy_audio
     * @see set_track_audio
     * @see load_raw_audio
     * @see load_raw_audio_no_copy
     * @see load_audio_io
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_LoadRawAudioNoCopy")]
    public static Audio load_raw_audio_no_copy (Mixer? mixer,
            void *data,
            size_t data_length,
            SDL.Audio.AudioSpec spec,
            bool free_when_done);

    /**
     * Lock a mixer by obtaining its internal mutex.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_LockMixer]]
     *
     * @param mixer the mixer to lock. May be null.
     *
     * @since 3.0.0
     *
     * @see unlock_mixer
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_LockMixer")]
    public static void lock_mixer (Mixer? mixer);

    /**
     * Convert milliseconds to sample frames at a specific sample rate.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_MSToFrames]]
     *
     * @param sample_rate the sample rate to use for conversion.
     * @param ms the milliseconds to convert to rate-specific sample frames.
     *
     * @return converted number of sample frames, or -1 on errors; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see frames_to_ms
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_MSToFrames")]
    public static int64 ms_to_frames (int sample_rate, int64 ms);

    /**
     * Pause all currently-playing tracks.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_PauseAllTracks]]
     *
     * @param mixer the mixer on which to pause all tracks.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see resume_track
     * @see resume_all_tracks
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_PauseAllTracks")]
    public static bool pause_all_tracks (Mixer mixer);

    /**
     * Pause all tracks with a specific tag.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_PauseTag]]
     *
     * @param mixer the mixer on which to pause tracks.
     * @param tag the tag to use when searching for tracks.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see pause_track
     * @see resume_track
     * @see resume_tag
     * @see tag_track
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_PauseTag")]
    public static bool pause_tag (Mixer mixer, string tag);

    /**
     * Pause a currently-playing track.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_PauseTrack]]
     *
     * @param track the track to pause.
     *
     * @return true if the track has paused, false on error; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see resume_track
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_PauseTrack")]
    public static bool pause_track (Track track);

    /**
     * Play a {@link Audio} from start to finish without any management.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_PlayAudio]]
     *
     * @param mixer the mixer on which to play this audio.
     * @param audio the audio input to play.
     *
     * @return true if the track has begun mixing, false on error; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see play_track
     * @see load_audio
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_PlayAudio")]
    public static bool play_audio (Mixer mixer, Audio audio);

    /**
     * Start (or restart) mixing all tracks with a specific tag for playback.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_PlayTag]]
     *
     * @param mixer the mixer on which to play this audio.
     * @param tag the tag to use when searching for tracks.
     * @param options the set of options that will be applied to each track.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see play_track
     * @see tag_track
     * @see stop_track
     * @see pause_track
     * @see track_playing
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_PlayTag")]
    public static bool play_tag (Mixer mixer, string tag, SDL.Properties.PropertiesID options);

    /**
     * Start (or restart) mixing a track for playback.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_PlayTrack]]
     *
     * @param track the track to start (or restart) mixing.
     * @param options a set of properties that control playback. May be zero.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see play_tag
     * @see play_audio
     * @see stop_track
     * @see pause_track
     * @see track_playing
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_PlayTrack")]
    public static bool play_track (Track track, SDL.Properties.PropertiesID options);

    /**
     * Deinitialize the SDL_mixer library.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_Quit]]
     *
     * @since 3.0.0
     *
     * @see init
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_Quit")]
    public static void quit ();

    /**
     * Resume all currently-paused tracks.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_PlayTrack]]
     *
     * @param mixer the mixer on which to resume all tracks.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see pause_track
     * @see pause_all_tracks
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_ResumeAllTracks")]
    public static bool resume_all_tracks (Mixer mixer);

    /**
     * Resume all tracks with a specific tag.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_ResumeTag]]
     *
     * @param mixer the mixer on which to resume all tracks.
     * @param tag the tag to use when searching for tracks.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see resume_track
     * @see pause_track
     * @see pause_tag
     * @see tag_track
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_ResumeTag")]
    public static bool resume_tag (Mixer mixer, string tag);

    /**
     * Resume a currently-paused track.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_ResumeTrack]]
     *
     * @param track the track to resume.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see pause_track
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_ResumeTrack")]
    public static bool resume_track (Track track);

    /**
     * Set a callback that fires when a mixer group has completed mixing.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_SetGroupPostMixCallback]]
     *
     * @param group the mixing group to assign this callback to.
     * @param callback the function to call when the group mixes. May be null.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see GroupMixCallback
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_SetGroupPostMixCallback")]
    public static bool set_group_post_mix_callback (Group group, GroupMixCallback? callback);

    /**
     * Set a mixer's master gain control.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_SetMixerGain]]
     *
     * @param mixer the mixer to adjust.
     * @param gain the new gain value.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see get_mixer_gain
     * @see set_track_gain
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_SetMixerGain")]
    public static bool set_mixer_gain (Mixer mixer, float gain);

    /**
     * Set a callback that fires when all mixing has completed.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_SetPostMixCallback]]
     *
     * @param mixer the mixer to assign this callback to.
     * @param callback the function to call when the group mixes. May be null.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see PostMixCallback
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_SetPostMixCallback", has_target = true)]
    public static bool set_post_mix_callback (Mixer mixer, PostMixCallback? callback);

    /**
     * Set the gain control of all tracks with a specific tag.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_SetTagGain]]
     *
     * @param mixer the mixer on which to look for tagged tracks.
     * @param tag the tag to use when searching for tracks.
     * @param gain the new gain value.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see get_track_gain
     * @see set_track_gain
     * @see set_mixer_gain
     * @see tag_track
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_SetTagGain")]
    public static bool set_tag_gain (Mixer mixer, string tag, float gain);

    /**
     * Set a track's position in 3D space.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_SetTrack3DPosition]]
     *
     * @param track the track on which to set a new audio input.
     * @param position the new 3D position for the track. May be null.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see get_track_3d_position
     * @see set_track_stereo
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_SetTrack3DPosition")]
    public static bool set_track_3d_position (Track track, Point3D? position);

    /**
     * Set a {@link Track}'s input to a {@link Audio}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_SetTrackAudio]]
     *
     * @param track the track on which to set a new audio input.
     * @param audio the new audio input to set. May be null.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_SetTrackAudio")]
    public static bool set_track_audio (Track track, Audio? audio);

    /**
     * Set a {@link Track}'s input to an {@link SDL.Audio.AudioStream}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_SetTrackAudioStream]]
     *
     * @param track the track on which to set a new audio input.
     * @param stream the audio stream to use as the track's input.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_SetTrackAudioStream")]
    public static bool set_track_audio_stream (Track track, SDL.Audio.AudioStream stream);

    /**
     * Set a callback that fires when the mixer has transformed a track's
     * audio.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_SetTrackCookedCallback]]
     *
     * @param track the track to assign this callback to.
     * @param callback the function to call when the group mixes. May be null.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see TrackMixCallback
     * @see set_track_raw_callback
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_SetTrackCookedCallback", has_target = true)]
    public static bool set_track_cooked_callback (Track track, TrackMixCallback? callback);

    /**
     * Change the frequency ratio of a track.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_SetTrackFrequencyRatio]]
     *
     * @param track the track on which to change the frequency ratio.
     * @param ratio the frequency ratio. Must be between 0.01f and 100.0f.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see get_track_frequency_ratio
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_SetTrackFrequencyRatio")]
    public static bool set_track_frequency_ratio (Track track, float ratio);

    /**
     * Set a track's gain control.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_SetTrackGain]]
     *
     * @param track the track to adjust.
     * @param gain the new gain value.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see get_track_gain
     * @see set_mixer_gain
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_SetTrackGain")]
    public static bool set_track_gain (Track track, float gain);

    /**
     * Assign a track to a mixing group.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_SetTrackGroup]]
     *
     * @param track the track to set mixing group assignment.
     * @param group the new mixing group to assign to. May be null.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see create_group
     * @see set_group_post_mix_callback
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_SetTrackGroup")]
    public static bool set_track_group (Track track, Group? group);

    /**
     * Set a {@link Track}'s input to an {@link SDL.IOStream.IOStream}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_SetTrackIOStream]]
     *
     * @param track the track on which to set a new audio input.
     * @param io the new i/o stream to use as the track's input.
     * @param close_io if true, close the stream when done with it.
     *
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see set_track_raw_io_stream
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_SetTrackIOStream")]
    public static bool set_track_io_stream (Track track, SDL.IOStream.IOStream io, bool close_io);

    /**
     * Change the number of times a currently-playing track will loop.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_SetTrackLoops]]
     *
     * @param track the track to configure.
     * @param num_loops new number of times to loop. Zero to disable
     * looping, -1 to loop infinitely.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see get_track_loops
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_SetTrackLoops")]
    public static bool set_track_loops (Track track, int num_loops);

    /**
     * Set the current output channel map of a track.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_SetTrackOutputChannelMap]]
     *
     * @param track the track to change.
     * @param channel_map the new channel map, null to reset to default.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_SetTrackOutputChannelMap")]
    public static bool set_track_output_channel_map (Track track, int[] ? channel_map);

    /**
     * Seek a playing track to a new position in its input.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_SetTrackPlaybackPosition]]
     *
     * @param track the track to change.
     * @param frames the sample frame position to seek to.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see get_track_playback_position
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_SetTrackPlaybackPosition")]
    public static bool set_track_playback_position (Track track, int64 frames);

    /**
     * Set a callback that fires when a {@link Track} has initial decoded
     * audio.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_SetTrackRawCallback]]
     *
     * @param track the track to assign this callback to.
     * @param callback the function to call when the track mixes. May be null.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see TrackMixCallback
     * @see set_track_cooked_callback
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_SetTrackRawCallback", has_target = true)]
    public static bool set_track_raw_callback (Track track, TrackMixCallback? callback);

    /**
     * Set a {@link Track}'s input to an {@link SDL.IOStream.IOStream}
     * providing raw PCM data.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_SetTrackRawIOStream]]
     *
     * @param track the track on which to set a new audio input.
     * @param io the new i/o stream to use as the track's input.
     * @param spec the format of the PCM data that the
     * {@link SDL.IOStream.IOStream} will provide.
     * @param close_io if true, close the stream when done with it.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see set_track_audio_stream
     * @see set_track_io_stream
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_SetTrackRawIOStream")]
    public static bool set_track_raw_io_stream (Track track,
            SDL.IOStream.IOStream io,
            SDL.Audio.AudioSpec spec,
            bool close_io);

    /**
     * Force a track to stereo output, with optionally left/right panning.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_SetTrackStereo]]
     *
     * @param track the track to adjust.
     * @param gains the per-channel gains, or null to disable spatialization.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see set_track_3d_position
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_SetTrackStereo")]
    public static bool set_track_stereo (Track track, StereoGains? gains);

    /**
     * Set a callback that fires when a {@link Track} is stopped.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_SetTrackStoppedCallback]]
     *
     * @param track the track to assign this callback to.
     * @param callback the function to call when the track mixes. May be null.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see TrackStoppedCallback
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_SetTrackStoppedCallback", has_target = true)]
    public static bool set_track_stopped_callback (Track track, TrackStoppedCallback? callback);

    /**
     * Halt all currently-playing tracks, possibly fading out over time.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_StopAllTracks]]
     *
     * @param mixer the mixer on which to stop all tracks.
     * @param fade_out_ms the number of milliseconds to spend fading out to
     * silence before halting. 0 to stop immediately.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see stop_track
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_StopAllTracks")]
    public static bool stop_all_tracks (Mixer mixer, int64 fade_out_ms);

    /**
     * Halt all tracks with a specific tag, possibly fading out over time.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_StopTag]]
     *
     * @param mixer the mixer on which to stop tracks.
     * @param tag the tag to use when searching for tracks.
     * @param fade_out_ms the number of milliseconds to spend fading out to
     * silence before halting. 0 to stop immediately.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see stop_track
     * @see tag_track
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_StopTag")]
    public static bool stop_tag (Mixer mixer, string tag, int64 fade_out_ms);

    /**
     * Halt a currently-playing track, possibly fading out over time.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_StopTrack]]
     *
     * @param track the track to halt.
     * @param fade_out_frames the number of sample frames to spend fading
     * out to silence before halting. 0 to stop immediately.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see play_track
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_StopTrack")]
    public static bool stop_track (Track track, int64 fade_out_frames);

    /**
     * Assign an arbitrary tag to a track.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_TagTrack]]
     *
     * @param track the track to add a tag to.
     * @param tag the tag to add.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see untag_track
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_TagTrack")]
    public static bool tag_track (Track track, string tag);

    /**
     * Convert sample frames for a track's current format to milliseconds.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_TrackFramesToMS]]
     *
     * @param track the track to query.
     * @param frames the track-specific sample frames to convert to milliseconds.
     *
     * @return converted number of milliseconds, or -1 for errors/no input;
     * call {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see track_ms_to_frames
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_TrackFramesToMS")]
    public static int64 track_frames_to_ms (Track track, int64 frames);

    /**
     * Convert milliseconds to sample frames for a track's current format.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_TrackMSToFrames]]
     *
     * @param track the track to query.
     * @param ms the milliseconds to convert to track-specific sample frames.
     *
     * @return converted number of sample frames, or -1 for errors/no input;
     * call {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see track_frames_to_ms
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_TrackMSToFrames")]
    public static int64 track_ms_to_frames (Track track, int64 ms);

    /**
     * Query if a track is currently paused.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_TrackPaused]]
     *
     * @param track the track to query.
     *
     * @return true if paused, false otherwise.
     *
     * @since 3.0.0
     *
     * @see play_track
     * @see pause_track
     * @see resume_track
     * @see stop_track
     * @see track_playing
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_TrackPaused")]
    public static bool track_paused (Track track);

    /**
     * Query if a track is currently playing.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_TrackPlaying]]
     *
     * @param track the track to query.
     *
     * @return true if playing, false otherwise.
     *
     * @since 3.0.0
     *
     * @see play_track
     * @see pause_track
     * @see resume_track
     * @see stop_track
     * @see track_paused
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_TrackPlaying")]
    public static bool track_playing (Track track);

    /**
     * Unlock a mixer previously locked by a call to {@link lock_mixer}
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_UnlockMixer]]
     *
     * @param mixer the mixer to unlock. May be null.
     *
     * @since 3.0.0
     *
     * @see lock_mixer
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_UnlockMixer")]
    public static void unlock_mixer (Mixer? mixer);

    /**
     * Remove an arbitrary tag from a track.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_UntagTrack]]
     *
     * @param track the track from which to remove a tag.
     * @param tag the tag to remove, or null to remove all current tags.
     *
     * @since 3.0.0
     *
     * @see tag_track
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_UntagTrack")]
    public static void untag_track (Track track, string ? tag);

    /**
     * Get the version of SDL_mixer that is linked against your program.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_Version]]
     *
     * @return the version of the linked library.
     *
     *
     * @since 3.0.0
     *
     * @see VERSION
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_Version")]
    public static int version ();

    /**
     * An opaque object that represents audio data.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_Audio]]
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [Compact, CCode (cname = "MIX_Audio", free_function = "", ref_function = "",
    unref_function = "", has_type_id = false)]
    public class Audio {}

    /**
     * An opaque object that represents an audio decoder.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_AudioDecoder]]
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [Compact, CCode (cname = "MIX_AudioDecoder", free_function = "", ref_function = "",
    unref_function = "", has_type_id = false)]
    public class AudioDecoder {}

    /**
     * An opaque object that represents a grouping of tracks.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_Group]]
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [Compact, CCode (cname = "MIX_Group", free_function = "", ref_function = "",
    unref_function = "", has_type_id = false)]
    public class Group {}

    /**
     * A callback that fires when a {@link Group} has completed mixing.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GroupMixCallback]]
     *
     * @param group the group that is being mixed.
     * @param spec the format of the data in pcm.
     * @param pcm the raw PCM data in float32 format.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_GroupMixCallback", has_target = true, instance_pos = 0)]
    public delegate void GroupMixCallback (Group group, SDL.Audio.AudioSpec spec, float[] pcm);

    /**
     * An opaque object that represents a mixer.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_Mixer]]
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [Compact, CCode (cname = "MIX_Mixer", free_function = "", ref_function = "",
    unref_function = "", has_type_id = false)]
    public class Mixer {}

    /**
     * A callback that fires when all mixing has completed.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_PostMixCallback]]
     *
     * @param mixer the mixer that is generating audio.
     * @param spec the format of the data in pcm.
     * @param pcm the raw PCM data in float32 format.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_PostMixCallback", has_target = true)]
    public delegate void PostMixCallback (Mixer mixer, SDL.Audio.AudioSpec spec, float[] pcm);

    /**
     * An opaque object that represents a source of sound output to be mixed.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_Track]]
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [Compact, CCode (cname = "MIX_Track", free_function = "", ref_function = "",
    unref_function = "", has_type_id = false)]
    public class Track {}

    /**
     * A callback that fires when a {@link Track} is mixing at various stages.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_PostMixCallback]]
     *
     * @param track the track that is being mixed.
     * @param spec the format of the data in pcm.
     * @param pcm the raw PCM data in float32 format.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_TrackMixCallback", has_target = true, instance_pos = 0)]
    public delegate void TrackMixCallback (Track track, SDL.Audio.AudioSpec spec, float[] pcm);

    /**
     * A callback that fires when a {@link Track} is stopped.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_TrackStoppedCallback]]
     *
     * @param track the track that has stopped.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_TrackStoppedCallback", has_target = true, instance_pos = 0)]
    public delegate void TrackStoppedCallback (Track track);

    /**
     * 3D coordinates for {@link set_track_3d_position}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_Point3D]]
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_Point3D", has_type_id = false)]
    public struct Point3D {
        /**
         * X coordinate (negative left, positive right).
         *
         */
        public float x;

        /**
         * Y coordinate (negative down, positive up).
         *
         */
        public float y;

        /**
         * Z coordinate (negative forward, positive back).
         *
         */
        public float z;
    } // Point3D

    /**
     * A set of per-channel gains for tracks using {@link set_track_stereo}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_StereoGains]]
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "MIX_StereoGains", has_type_id = false)]
    public struct StereoGains {
        /**
         * Left channel gain.
         *
         */
        float left;

        /**
         * Right channel gain.
         *
         */
        float right;
    } // StereoGains

    /**
     * The SDL3 Mixer MAJOR_VERSION constant. The first part of the
     * printable format: "%d.%d.%d", MAJOR, MINOR, MICRO.
     *
     *   * [[https://wiki.libsdl.org/SDL3_mixer/SDL_MIXER_MAJOR_VERSION]]
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "SDL_MIXER_MAJOR_VERSION")]
    public const int MAJOR_VERSION;

    /**
     * The SDL3 Mixer MINOR_VERSION constant. The second part of the
     * printable format: "%d.%d.%d", MAJOR, MINOR, MICRO.
     *
     *   * [[https://wiki.libsdl.org/SDL3_mixer/SDL_MIXER_MINOR_VERSION]]
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "SDL_MIXER_MINOR_VERSION")]
    public const int MINOR_VERSION;

    /**
     * The SDL3 Mixer MICRO_VERSION constant. The third part of the
     * printable format: "%d.%d.%d", MAJOR, MINOR, MICRO.
     *
     *   * [[https://wiki.libsdl.org/SDL3_mixer/SDL_MIXER_MICRO_VERSION]]
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "SDL_MIXER_MICRO_VERSION")]
    public const int MICRO_VERSION;

    /**
     * This is the version number macro for the current SDL_mixer version. In
     * printable format: "%d.%d.%d", MAJOR, MINOR, MICRO.
     *
     *   * [[https://wiki.libsdl.org/SDL3_mixer/SDL_MIXER_VERSION]]
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "SDL_MIXER_VERSION")]
    public const int VERSION;

    /**
     * This macro will evaluate to true if compiled with SDL_mixer at least X.Y.Z.
     *
     *   * [[https://wiki.libsdl.org/SDL3_mixer/SDL_MIXER_VERSION_ATLEAST]]
     *
     * @param major the major version number.
     * @param minor the minor version number.
     * @param micro the micro version number.
     *
     * @return true if the SDL3 Mixer version is at least '''major.minor.micro''',
     * false otherwise.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "SDL_MIXER_VERSION_ATLEAST")]
    public static bool version_at_least (int major, int minor, int micro);

    /**
     * Constants for duration of a {@link Track} obtained via
     * {@link get_audio_duration}.
     *
     * @since 3.0.0
     */
    [CCode (cname = "Sint64", cprefix = "MIX_DURATION_", has_type_id = false)]
    public enum Duration {
        /**
         * Unknown duration
         *
         */
        UNKNOWN,

        /**
         * Infinite duration
         *
         */
        INFINITE,
    }

    /**
     * Loading {@link Audio} properties for {@link load_audio_with_properties}.
     *
     */
    namespace PropAudioLoad {
        /**
         * A pointer to an SDL_IOStream to be used to load audio data.
         * Required. This stream must be able to seek!
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_LoadAudioWithProperties]]
         *
         * @since 3.0.0
         */
        [CCode (cname = "MIX_PROP_AUDIO_LOAD_IOSTREAM_POINTER")]
        public static string IOSTREAM_POINTER;

        /**
         * True if SDL_mixer should close the SDL_IOStream before returning
         * (success or failure).
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_LoadAudioWithProperties]]
         *
         * @since 3.0.0
         */
        [CCode (cname = "MIX_PROP_AUDIO_LOAD_CLOSEIO_BOOLEAN")]
        public static string CLOSEIO_BOOLEAN;

        /**
         * True if SDL_mixer should fully decode and decompress the data
         * before returning. Otherwise it will be stored in its original
         * state and decompressed on demand.
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_LoadAudioWithProperties]]
         *
         * @since 3.0.0
         */
        [CCode (cname = "MIX_PROP_AUDIO_LOAD_PREDECODE_BOOLEAN")]
        public static string PREDECODE_BOOLEAN;

        /**
         * A pointer to a {@link Mixer}, in case steps can be made to match
         * its format when decoding. Optional.
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_LoadAudioWithProperties]]
         *
         * @since 3.0.0
         */
        [CCode (cname = "MIX_PROP_AUDIO_LOAD_PREFERRED_MIXER_POINTER")]
        public static string PREFERRED_MIXER_POINTER;

        /**
         * True to skip parsing metadata tags, like ID3 and APE tags.
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_LoadAudioWithProperties]]
         *
         * @since 3.0.0
         */
        [CCode (cname = "MIX_PROP_AUDIO_LOAD_SKIP_METADATA_TAGS_BOOLEAN")]
        public static string SKIP_METADATA_TAGS_BOOLEAN;

        /**
         * The name of the decoder to use for this data. Optional.
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_LoadAudioWithProperties]]
         *
         * @since 3.0.0
         */
        [CCode (cname = "MIX_PROP_AUDIO_DECODER_STRING")]
        public static string DECODER_STRING;
    }

    /**
     * {@link Audio} properties for {@link get_audio_properties}
     * and {@link load_audio_with_properties}.
     *
     */
    namespace PropAudioMetadata {
        /**
         * The audio's title ("Smells Like Teen Spirit").
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetAudioProperties]]
         *
         * @since 3.0.0
         */
        [CCode (cname = "MIX_PROP_METADATA_TITLE_STRING")]
        public static string TITLE_STRING;

        /**
         * The audio's artist name ("Nirvana").
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetAudioProperties]]
         *
         * @since 3.0.0
         */
        [CCode (cname = "MIX_PROP_METADATA_ARTIST_STRING")]
        public static string ARTIST_STRING;

        /**
         * The audio's album name ("Nevermind").
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetAudioProperties]]
         *
         * @since 3.0.0
         */
        [CCode (cname = "MIX_PROP_METADATA_ALBUM_STRING")]
        public static string ALBUM_STRING;

        /**
         * The audio's copyright info ("Copyright (c) 1991")
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetAudioProperties]]
         *
         * @since 3.0.0
         */
        [CCode (cname = "MIX_PROP_METADATA_COPYRIGHT_STRING")]
        public static string COPYRIGHT_STRING;

        /**
         * The audio's track number on the album (1)
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetAudioProperties]]
         *
         * @since 3.0.0
         */
        [CCode (cname = "MIX_PROP_METADATA_TRACK_NUMBER")]
        public static string TRACK_NUMBER;

        /**
         * The total tracks on the album (13)
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetAudioProperties]]
         *
         * @since 3.0.0
         */
        [CCode (cname = "MIX_PROP_METADATA_TOTAL_TRACKS_NUMBER")]
        public static string TOTAL_TRACKS_NUMBER;

        /**
         * The year the audio was released (1991)
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetAudioProperties]]
         *
         * @since 3.0.0
         */
        [CCode (cname = "MIX_PROP_METADATA_YEAR_NUMBER")]
        public static string YEAR_NUMBER;

        /**
         * The sample frames worth of PCM data that comprise this audio.
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetAudioProperties]]
         *
         * @since 3.0.0
         */
        [CCode (cname = "MIX_PROP_METADATA_DURATION_FRAMES_NUMBER")]
        public static string DURATION_FRAMES_NUMBER;

        /**
         * If true, audio never runs out of sound to generate.
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetAudioProperties]]
         *
         * @since 3.0.0
         */
        [CCode (cname = "MIX_PROP_METADATA_DURATION_INFINITE_BOOLEAN")]
        public static string DURATION_INFINITE_BOOLEAN;
    }

    /**
     * Properties to use in {@link get_mixer_properties}
     *
     */
    namespace PropMixer {
        /**
         * The {@link SDL.Audio.AudioDeviceID} that this mixer has opened
         * for playback.
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_GetMixerProperties]]
         *
         * @since 3.0.0
         */
        [CCode (cname = "MIX_PROP_MIXER_DEVICE_NUMBER")]
        public static string DEVICE_NUMBER;
    }

    /**
     * Properties to be used in {@link play_track} and {@link play_tag}.
     *
     */
    namespace PropPlay {
        /**
         * The number of times to loop the track when it reaches the end. A
         * value of 1 will loop to the start one time.
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_PlayTrack]]
         *
         * @since 3.0.0
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "MIX_PROP_PLAY_LOOPS_NUMBER")]
        public static string LOOPS_NUMBER;

        /**
         * Mix at most to this sample frame position in the track.
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_PlayTrack]]
         *
         * @since 3.0.0
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "MIX_PROP_PLAY_MAX_FRAME_NUMBER")]
        public static string MAX_FRAME_NUMBER;

        /**
         * The same as using the
         * * {@link PropPlay.MAX_FRAME_NUMBER} property, but
         * the value is specified in milliseconds instead of sample frames.
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_PlayTrack]]
         *
         * @since 3.0.0
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "MIX_PROP_PLAY_MAX_MILLISECONDS_NUMBER")]
        public static string MAX_MILLISECONDS_NUMBER;

        /**
         * Start mixing from this sample frame position in the track's input.
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_PlayTrack]]
         *
         * @since 3.0.0
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "MIX_PROP_PLAY_START_FRAME_NUMBER")]
        public static string START_FRAME_NUMBER;

        /**
         * The same as using the
         * * {@link PropPlay.START_FRAME_NUMBER} property, but
         * the value is specified in milliseconds instead of sample frames.
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_PlayTrack]]
         *
         * @since 3.0.0
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "MIX_PROP_PLAY_START_MILLISECOND_NUMBER")]
        public static string START_MILLISECOND_NUMBER;

        /**
         * If the track is looping, this is the sample frame position that
         * the track will loop back to.
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_PlayTrack]]
         *
         * @since 3.0.0
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "MIX_PROP_PLAY_LOOP_START_FRAME_NUMBER")]
        public static string LOOP_START_FRAME_NUMBER;

        /**
         * The same as using the
         * * {@link PropPlay.LOOP_START_FRAME_NUMBER} property, but
         * the value is specified in milliseconds instead of sample frames.
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_PlayTrack]]
         *
         * @since 3.0.0
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "MIX_PROP_PLAY_LOOP_START_MILLISECOND_NUMBER")]
        public static string LOOP_START_MILLISECOND_NUMBER;

        /**
         * The number of sample frames over which to fade in the
         * newly-started track.
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_PlayTrack]]
         *
         * @since 3.0.0
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "MIX_PROP_PLAY_FADE_IN_FRAMES_NUMBER")]
        public static string FADE_IN_FRAMES_NUMBER;

        /**
         * The same as using the
         * * {@link PropPlay.FADE_IN_FRAMES_NUMBER} property, but
         * the value is specified in milliseconds instead of sample frames.
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_PlayTrack]]
         *
         * @since 3.0.0
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "MIX_PROP_PLAY_FADE_IN_MILLISECONDS_NUMBER")]
        public static string FADE_IN_MILLISECONDS_NUMBER;

        /**
         * If fading in, start fading from this volume level. 0.0f is silence
         * and 1.0f is full volume, every in between is a linear change in
         * gain. The specified value will be clamped.
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_PlayTrack]]
         *
         * @since 3.0.0
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "MIX_PROP_PLAY_FADE_IN_START_GAIN_FLOAT")]
        public static string FADE_IN_START_GAIN_FLOAT;

        /**
         * At the end of mixing this track, after all loops are complete,
         * append this many sample frames of silence as if it were part of
         * the audio file.
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_PlayTrack]]
         *
         * @since 3.0.0
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "MIX_PROP_PLAY_APPEND_SILENCE_FRAMES_NUMBER")]
        public static string APPEND_SILENCE_FRAMES_NUMBER;

        /**
         * Same as using the
         * {@link PropPlay.APPEND_SILENCE_FRAMES_NUMBER} property, but
         * the value is specified in milliseconds instead of sample frames.
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_PlayTrack]]
         *
         * @since 3.0.0
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "MIX_PROP_PLAY_APPEND_SILENCE_MILLISECONDS_NUMBER")]
        public static string APPEND_SILENCE_MILLISECONDS_NUMBER;

        /**
         * If true, when input is completely consumed for the track, the mixer
         * will mark the track as stopped; to play more, the track will need to
         * be restarted.
         *
         *  * [[https://wiki.libsdl.org/SDL3_mixer/MIX_PlayTrack]]
         *
         * @since 3.0.0
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "MIX_PROP_PLAY_HALT_WHEN_EXHAUSTED_BOOLEAN")]
        public static string HALT_WHEN_EXHAUSTED_BOOLEAN;
    }
}
