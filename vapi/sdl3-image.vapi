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
 * https://wiki.libsdl.org/SDL3_image/CategoryAPI
 */

/**
 * ''The SDL3 Image Library Vala bindings.''
 *
 * This is a simple library to load images of various formats as SDL
 * surfaces.
 *
 * It can load BMP, GIF, JPEG, LBM, PCX, PNG, PNM (PPM/PGM/PBM),
 * QOI, TGA, XCF, XPM, and simple SVG format images.
 *
 * It can also load AVIF,
 * JPEG-XL, TIFF, and WebP images, depending on build options.
 *
 *  * ''C-Documentation reference: '' [[https://wiki.libsdl.org/SDL3_image/]]
 */
[CCode (cheader_filename = "SDL3_image/SDL_image.h")]
namespace SDL.Image {
    /**
     * Add a frame to an animation encoder.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_AddAnimationEncoderFrame]]
     *
     * @param encoder the receiving images.
     * @param surface the surface to add as the next frame in the animation.
     * @param duration the duration of the frame, usually in milliseconds but
     * can be other units if the
     * {@link PropAnimationEncoderCreate.TIMEBASE_DENOMINATOR_NUMBER} property
     * is set when creating the encoder.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see create_animation_encoder
     * @see create_animation_encoder_io
     * @see create_animation_encoder_with_properties
     * @see close_animation_encoder
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_AddAnimationEncoderFrame")]
    public static bool add_animation_encoder_frame (AnimationEncoder encoder,
                                                    SDL.Surface.Surface surface,
                                                    uint64 duration);

    /**
     * Add a frame to a stream of images being saved.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_AddAnimationFrame]]
     *
     * @param stream the stream receiving images.
     * @param surface the surface to add as the next frame in the animation.
     * @param duration the duration of the frame, usually in milliseconds but
     * can be other units if the
      {@link PropAnimationStreamCreate.TIMEBASE_DENOMINATOR_NUMBER} property
     * is set when creating the encoder.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see create_animation_stream
     * @see create_animation_stream_io
     * @see create_animation_stream_with_properties
     * @see close_animation_stream
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_AddAnimationFrame")]
    public static bool add_animation_frame (AnimationStream stream,
                                            SDL.Surface.Surface surface,
                                            uint64 duration);

    /**
     * Animated image support
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_Animation]]
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [Compact, CCode (cname = "IMG_Animation", free_function= "", has_type_id = false)]
    public class Animation {
        /**
         * The width of the frames
         *
         */
        public int w;

        /**
         * The height of the frames
         *
         */
        public int h;

        /**
         * An array of frames
         *
         */
        [CCode (array_length_cname = "count", array_length_type = "int")]
        public SDL.Surface.Surface[] frames;

        /**
         * An array of frame delays, in milliseconds
         *
         */
        [CCode (array_length_cname = "count", array_length_type = "int")]
        public int[] delays;
    } // Animation

    /**
     * An object representing animation decoder.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_AnimationDecoder]]
     *
     * @since 3.4.0
     */
    [Version (since = "3.4.0")]
    [Compact, CCode (cname = "IMG_AnimationDecoder", free_function = "", ref_function = "",
    unref_function = "", has_type_id = false)]
    public class AnimationDecoder {}

    /**
     * An enum representing the status of an animation decoder.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_AnimationDecoder]]
     *
     * @since 3.4.0
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_AnimationDecoderStatus", cprefix = "IMG_DECODER_STATUS_", has_type_id = false)]
    public enum AnimationDecoderStatus
    {
        /**
         * The decoder is invalid
         *
         */
        INVALID,

        /**
         *  The decoder is ready to decode the next frame
         *
         */
        OK,

        /**
         * The decoder failed to decode a frame,
         * call {@link SDL.Error.get_error} for more information.
         *
         */
        FAILED,

        /**
         * No more frames available
         *
         */
        COMPLETE,
    } // AnimationDecoderStatus

    /**
     * An object representing the encoder context.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_AnimationEncoder]]
     *
     * @since 3.4.0
     */
    [Version (since = "3.4.0")]
    [Compact, CCode (cname = "IMG_AnimationEncoder", free_function = "", ref_function = "",
    unref_function = "", has_type_id = false)]
    public class AnimationEncoder {}

    /**
     * An object representing a stream of images being saved.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_AnimationStream]]
     *
     * @since 3.4.0
     */
    [Version (since = "3.4.0")]
    [Compact, CCode (cname = "IMG_AnimationStream", free_function = "", ref_function = "",
    unref_function = "", has_type_id = false)]
    public class AnimationStream {}

    /**
     * Close an animation decoder, finishing any decoding.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CloseAnimationDecoder]]
     *
     * @param decoder the decoder to close.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see create_animation_decoder
     * @see create_animation_decoder_io
     * @see create_animation_decoder_with_properties
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_CloseAnimationDecoder")]
    public static bool close_animation_decoder (AnimationDecoder decoder);

    /**
     * Close an animation encoder, finishing any encoding.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CloseAnimationEncoder]]
     *
     * @param encoder the encoder to close.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see create_animation_encoder
     * @see create_animation_encoder_io
     * @see create_animation_encoder_with_properties
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_CloseAnimationEncoder")]
    public static bool close_animation_encoder (AnimationEncoder encoder);

    /**
     * Close an animation encoder, finishing any encoding.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CloseAnimationStream]]
     *
     * @param stream the stream to close.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see create_animation_stream
     * @see create_animation_stream_io
     * @see create_animation_stream_with_properties
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_CloseAnimationStream")]
    public static bool close_animation_stream (AnimationStream stream);

    /**
     * Create an animated cursor from an animation.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimatedCursor]]
     *
     * @param anim an animation to use to create an animated cursor.
     * @param hot_x the x position of the cursor hot spot.
     * @param hot_y the y position of the cursor hot spot.
     *
     * @return the new cursor on success or null on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see load_animation
     * @see load_animation_io
     * @see load_animation_typed_io
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_CreateAnimatedCursor")]
    public static SDL.Mouse.Cursor create_animated_cursor (Animation anim, int hot_x, int hot_y);

    /**
     * Create a decoder to read a series of images from a file.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationDecoder]]
     *
     * @param file the file containing a series of images.
     *
     * @return a new {@link AnimationDecoder}, or null on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see create_animation_decoder_io
     * @see create_animation_decoder_with_properties
     * @see get_animation_decoder_frame
     * @see close_animation_decoder
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_CreateAnimationDecoder")]
    public static AnimationDecoder create_animation_decoder (string file);

    /**
     * Create a decoder to read a series of images from a file.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationDecoder_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} containing a series of
     * images.
     * @param close_io true to close the {@link SDL.IOStream.IOStream} when
     * done, false to leave it open.
     * @param type a filename extension that represent this data ("WEBP", etc).
     *
     * @return a new {@link AnimationDecoder}, or null on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see create_animation_decoder
     * @see create_animation_decoder_with_properties
     * @see get_animation_decoder_frame
     * @see reset_animation_decoder
     * @see close_animation_decoder
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_CreateAnimationDecoder_IO")]
    public static AnimationDecoder create_animation_decoder_io (SDL.IOStream.IOStream src,
                                                                bool close_io,
                                                                string type);

    /**
     * Create an animation decoder with the specified properties.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationDecoderWithProperties]]
     *
     * @param props the properties of the animation decoder.
     *
     * @return a new {@link AnimationDecoder}, or null on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see create_animation_decoder
     * @see create_animation_decoder_io
     * @see get_animation_decoder_frame
     * @see reset_animation_decoder
     * @see close_animation_decoder
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_CreateAnimationDecoderWithProperties")]
    public static AnimationDecoder create_animation_decoder_with_properties (SDL.Properties.PropertiesID props);

    /**
     * Create an encoder to save a series of images to a file.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationEncoder]]
     *
     * @param file the file where the animation will be saved.
     *
     * @return a new {@link AnimationEncoder}, or null on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see create_animation_encoder_io
     * @see create_animation_encoder_with_properties
     * @see add_animation_encoder_frame
     * @see close_animation_encoder
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_CreateAnimationEncoder")]
    public static AnimationEncoder create_animation_encoder (string file);

    /**
     * Create an encoder to save a series of images to an
     * {@link SDL.IOStream.IOStream}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationEncoder_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream}. that will be used to save
     * the stream.
     * @param close_io true to close the {@link SDL.IOStream.IOStream} when
     * done, false to leave it open.
     * @param type a filename extension that represent this data ("WEBP", etc).
     *
     * @return a new {@link AnimationEncoder}, or nullon failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see create_animation_encoder
     * @see create_animation_encoder_with_properties
     * @see add_animation_encoder_frame
     * @see close_animation_encoder
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_CreateAnimationEncoder_IO")]
    public static AnimationEncoder create_animation_encoder_io (SDL.IOStream.IOStream src,
                                                                bool close_io,
                                                                string type);

    /**
     * Create an animation encoder with the specified properties.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationEncoderWithProperties]]
     *
     * @param props the properties of the animation encoder.
     *
     * @return a new {@link AnimationEncoder}, or nullon failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see create_animation_encoder
     * @see create_animation_encoder_io
     * @see add_animation_encoder_frame
     * @see close_animation_encoder
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_CreateAnimationEncoderWithProperties")]
    public static AnimationEncoder create_animation_encoder_with_properties (SDL.Properties.PropertiesID props);

    /**
     * Create an animation stream and save it to a file.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationStream]]
     *
     * @param file the file where the animation will be saved.
     *
     * @return a new {@link AnimationStream}, or nullon failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see create_animation_stream_io
     * @see create_animation_stream_with_properties
     * @see add_animation_encoder_frame
     * @see close_animation_stream
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_CreateAnimationStream")]
    public static AnimationStream create_animation_stream (string file);

    /**
     * Create an animation stream and save it to an
     * {@link SDL.IOStream.IOStream}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationStream_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream}. that will be used to save
     * the stream.
     * @param close_io true to close the {@link SDL.IOStream.IOStream} when
     * done, false to leave it open.
     * @param type a filename extension that represent this data ("WEBP", etc).
     *
     * @return a new {@link AnimationStream}, or nullon failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see create_animation_stream
     * @see create_animation_stream_with_properties
     * @see add_animation_encoder_frame
     * @see close_animation_stream
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_CreateAnimationStream_IO")]
    public static AnimationStream create_animation_stream_io (SDL.IOStream.IOStream src,
                                                              bool close_io,
                                                              string type);

    /**
     * Create an animation stream and save it to an
     * {@link SDL.IOStream.IOStream}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationStream_IO]]
     *
     * @param props the properties of the animation stream.
     *
     * @return a new {@link AnimationStream}, or nullon failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see create_animation_stream
     * @see create_animation_stream_io
     * @see add_animation_encoder_frame
     * @see close_animation_stream
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_CreateAnimationStreamWithProperties")]
    public static AnimationStream create_animation_stream_with_properties (SDL.Properties.PropertiesID props);

    /**
     * Dispose of an {@link Animation} and free its resources.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_FreeAnimation]]
     *
     * @param anim {@link Animation} to dispose of.
     *
     * @since 3.0.0
     *
     * @see load_animation
     * @see load_animation_io
     * @see load_animation_typed_io
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_FreeAnimation")]
    public static void free_animation (Animation anim);

    /**
     * Get the next frame in an animation decoder.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_GetAnimationDecoderFrame]]
     *
     * @param decoder the animation decoder.
     * @param frame a pointer filled in with the {@link SDL.Surface.Surface}
     * for the next frame in the animation.
     * @param duration the duration of the frame, usually in milliseconds but
     * can be other units if the
     * {@link PropAnimationDecoderCreate.TIMEBASE_DENOMINATOR_NUMBER} property
     * is set when creating the decoder.
     *
     * @return true on success or false on failure and when no more frames are
     * available; call {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see create_animation_decoder
     * @see create_animation_decoder_io
     * @see create_animation_decoder_with_properties
     * @see get_animation_decoder_status
     * @see reset_animation_decoder
     * @see close_animation_decoder
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_GetAnimationDecoderFrame")]
    public static AnimationStream get_animation_decoder_frame (AnimationDecoder decoder,
                                                               out SDL.Surface.Surface frame,
                                                               out uint64 duration);

    /**
     * Get the metadata of an animation decoder.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_GetAnimationDecoderMetadata]]
     *
     * @param decoder the animation decoder.
     *
     * @return a {@link SDL.Properties.PropertiesID} containing the metadata,
     * or 0 if there is no metadata available.
     *
     * @since 3.4.0
     *
     * @see get_animation_decoder_frame
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_GetAnimationDecoderMetadata")]
    public static SDL.Properties.PropertiesID get_animation_decoder_metadata (AnimationDecoder decoder);

    /**
     * Get the properties of an animation decoder.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_GetAnimationDecoderProperties]]
     *
     * @param decoder the animation decoder.
     *
     * @return the properties ID of the animation decoder, or 0 if there are
     * no properties; call {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see create_animation_decoder
     * @see create_animation_decoder_io
     * @see create_animation_decoder_with_properties
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_GetAnimationDecoderProperties")]
    public static SDL.Properties.PropertiesID get_animation_decoder_properties (AnimationDecoder decoder);

    /**
     * Get the decoder status indicating the current state of the decoder.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_GetAnimationDecoderStatus]]
     *
     * @param decoder the animation decoder.
     *
     * @return the status of the underlying decoder, or
     * {@link AnimationDecoderStatus.INVALID} if the given decoder is invalid.
     *
     * @since 3.4.0
     *
     * @see get_animation_decoder_frame
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_GetAnimationDecoderStatus")]
    public static AnimationDecoderStatus get_animation_decoder_status (AnimationDecoder decoder);

    /**
     * Get the image currently in the clipboard.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_GetClipboardImage]]
     *
     * @return a new SDL surface, or null if no supported image is available.
     *
     * @since 3.4.0
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_GetClipboardImage")]
    public static SDL.Surface.Surface? get_clipboard_image ();

    /**
     * Detect ANI image data on a readable/seekable SDL_IOStream.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_isANI]]
     *
     * @param src a seekable/readable SDL_IOStream to provide image data.
     *
     * @return true if this is ANI data, false otherwise.
     *
     * @since 3.4.0
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_isANI")]
    public static bool is_ani (SDL.IOStream.IOStream src);


    /**
     * Detect AVIF image data on a readable/seekable SDL_IOStream.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_isAVIF]]
     *
     * @param src a seekable/readable SDL_IOStream to provide image data.
     *
     * @return true if this is AVIF data, false otherwise.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_isAVIF")]
    public static bool is_avif (SDL.IOStream.IOStream src);

    /**
     * Detect BMP image data on a readable/seekable SDL_IOStream.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_isBMP]]
     *
     * @param src a seekable/readable SDL_IOStream to provide image data.
     *
     * @return true if this is BMP data, false otherwise.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_isBMP")]
    public static bool is_bmp (SDL.IOStream.IOStream src);

    /**
     * Detect CUR image data on a readable/seekable SDL_IOStream.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_isCUR]]
     *
     * @param src a seekable/readable SDL_IOStream to provide image data.
     *
     * @return true if this is CUR data, false otherwise.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_isCUR")]
    public static bool is_cur (SDL.IOStream.IOStream src);

    /**
     * Detect GIF image data on a readable/seekable SDL_IOStream.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_isGIF]]
     *
     * @param src a seekable/readable SDL_IOStream to provide image data.
     *
     * @return true if this is GIF data, false otherwise.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_isGIF")]
    public static bool is_gif (SDL.IOStream.IOStream src);

    /**
     * Detect ICO image data on a readable/seekable SDL_IOStream.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_isICO]]
     *
     * @param src a seekable/readable SDL_IOStream to provide image data.
     *
     * @return true if this is ICO data, false otherwise.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_isICO")]
    public static bool is_ico (SDL.IOStream.IOStream src);

    /**
     * Detect JPG image data on a readable/seekable SDL_IOStream.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_isJPG]]
     *
     * @param src a seekable/readable SDL_IOStream to provide image data.
     *
     * @return true if this is JPG data, false otherwise.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_isJPG")]
    public static bool is_jpg (SDL.IOStream.IOStream src);

    /**
     * Detect JXL image data on a readable/seekable SDL_IOStream.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_isJXL]]
     *
     * @param src a seekable/readable SDL_IOStream to provide image data.
     *
     * @return true if this is JXL data, false otherwise.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_isJXL")]
    public static bool is_jxl (SDL.IOStream.IOStream src);

    /**
     * Detect LBM image data on a readable/seekable SDL_IOStream.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_isLBM]]
     *
     * @param src a seekable/readable SDL_IOStream to provide image data.
     *
     * @return true if this is LBM data, false otherwise.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_isLBM")]
    public static bool is_lbm (SDL.IOStream.IOStream src);

    /**
     * Detect PCX image data on a readable/seekable SDL_IOStream.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_isPCX]]
     *
     * @param src a seekable/readable SDL_IOStream to provide image data.
     *
     * @return true if this is PCX data, false otherwise.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_isPCX")]
    public static bool is_pcx (SDL.IOStream.IOStream src);

    /**
     * Detect PNG image data on a readable/seekable SDL_IOStream.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_isPNG]]
     *
     * @param src a seekable/readable SDL_IOStream to provide image data.
     *
     * @return true if this is PNG data, false otherwise.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_isPNG")]
    public static bool is_png (SDL.IOStream.IOStream src);

    /**
     * Detect PNM image data on a readable/seekable SDL_IOStream.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_isPNM]]
     *
     * @param src a seekable/readable SDL_IOStream to provide image data.
     *
     * @return true if this is PNM data, false otherwise.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_isPNM")]
    public static bool is_pnm (SDL.IOStream.IOStream src);

    /**
     * Detect QOI image data on a readable/seekable SDL_IOStream.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_isQOI]]
     *
     * @param src a seekable/readable SDL_IOStream to provide image data.
     *
     * @return true if this is QOI data, false otherwise.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_isQOI")]
    public static bool is_qoi (SDL.IOStream.IOStream src);

    /**
     * Detect SVG image data on a readable/seekable SDL_IOStream.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_isSVG]]
     *
     * @param src a seekable/readable SDL_IOStream to provide image data.
     *
     * @return true if this is SVG data, false otherwise.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_isSVG")]
    public static bool is_svg (SDL.IOStream.IOStream src);

    /**
     * Detect TIF image data on a readable/seekable SDL_IOStream.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_isTIF]]
     *
     * @param src a seekable/readable SDL_IOStream to provide image data.
     *
     * @return true if this is TIF data, false otherwise.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_isTIF")]
    public static bool is_tif (SDL.IOStream.IOStream src);

    /**
     * Detect WEBP image data on a readable/seekable SDL_IOStream.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_isWEBP]]
     *
     * @param src a seekable/readable SDL_IOStream to provide image data.
     *
     * @return true if this is WEBP data, false otherwise.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_isWEBP")]
    public static bool is_webp (SDL.IOStream.IOStream src);

    /**
     * Detect XCF image data on a readable/seekable SDL_IOStream.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_isXCF]]
     *
     * @param src a seekable/readable SDL_IOStream to provide image data.
     *
     * @return true if this is XCF data, false otherwise.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_isXCF")]
    public static bool is_xcf (SDL.IOStream.IOStream src);

    /**
     * Detect XPM image data on a readable/seekable SDL_IOStream.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_isXPM]]
     *
     * @param src a seekable/readable SDL_IOStream to provide image data.
     *
     * @return true if this is XPM data, false otherwise.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_isXPM")]
    public static bool is_xpm (SDL.IOStream.IOStream src);

    /**
     * Detect XV image data on a readable/seekable SDL_IOStream.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_isXV]]
     *
     * @param src a seekable/readable SDL_IOStream to provide image data.
     *
     * @return true if this is XV data, false otherwise.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_isXV")]
    public static bool is_xv (SDL.IOStream.IOStream src);

    /**
     * Load an image from a filesystem path into a software surface.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_Load]]
     *
     * @param file a path on the filesystem to load an image from.
     *
     * @return a new {@link SDL.Surface.Surface}, or null on error.
     *
     * @since 3.0.0
     *
     * @see load_typed_io
     * @see load_io
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_Load")]
    public static SDL.Surface.Surface ? load (string file);

    /**
     * Load an image from an SDL data source into a software surface.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_Load_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     * @param close_io true to close/free the SDL_IOStream before returning, false to leave it open.
     *
     * @return a new {@link SDL.Surface.Surface}, or null on error.
     *
     * @since 3.0.0
     *
     * @see load
     * @see load_typed_io
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_Load_IO")]
    public static SDL.Surface.Surface ? load_io (SDL.IOStream.IOStream src, bool close_io);

    /**
     * Load an ANI animation directly from an {@link SDL.IOStream.IOStream}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadANIAnimation_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     *
     * @return a new {@link Animation}, or null on error.
     *
     * @since 3.4.0
     *
     * @see is_ani
     * @see load_animation
     * @see load_animation_io
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_LoadANIAnimation_IO")]
    public static Animation ? load_ani_animation_io (SDL.IOStream.IOStream src);


    /**
     * Load an animation from a file.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadAnimation]]
     *
     * @param file path on the filesystem containing an animated image.
     *
     * @return a new {@link Animation}, or null on error.
     *
     * @since 3.0.0
     *
     * @see load_animation
     * @see load_animation_typed_io
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadAnimation")]
    public static Animation ? load_animation (string file);

    /**
     * Load an animation from an SDL data source.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadAnimation_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     * @param close_io true to close/free the SDL_IOStream before returning, false to leave it open.
     *
     * @return a new {@link Animation}, or null on error.
     *
     * @since 3.0.0
     *
     * @see load_animation
     * @see load_animation_typed_io
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadAnimation_IO")]
    public static Animation ? load_animation_io (SDL.IOStream.IOStream src, bool close_io);

    /**
     * Load an animation from an SDL data source.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadAnimationTyped_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     * @param close_io true to close/free the SDL_IOStream before returning, false to leave it open.
     * @param type a filename extension that represent this data ("GIF", etc).
     *
     * @return a new {@link Animation}, or null on error.
     *
     * @since 3.0.0
     *
     * @see load_animation
     * @see load_animation_typed_io
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadAnimationTyped_IO")]
    public static Animation ? load_animation_typed_io (SDL.IOStream.IOStream src, bool close_io, string type);

    /**
     * Load an APNG animation directly from an {@link SDL.IOStream.IOStream}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadAPNGAnimation_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     *
     * @return a new {@link Animation}, or null on error.
     *
     * @since 3.4.0
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_LoadAPNGAnimation_IO")]
    public static Animation ? load_apng_animation_io (SDL.IOStream.IOStream src);

    /**
     * Load an AVIF image directly.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadAVIF_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     *
     * @return a new {@link SDL.Surface.Surface}, or null on error.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadAVIF_IO")]
    public static SDL.Surface.Surface ? load_avif_io (SDL.IOStream.IOStream src);

    /**
     * Load an AVIF animation directly from an {@link SDL.IOStream.IOStream}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadAVIFAnimation_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     *
     * @return a new {@link Animation}, or null on error.
     *
     * @since 3.4.0
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_LoadAVIFAnimation_IO")]
    public static Animation ? load_avif_animation_io (SDL.IOStream.IOStream src);

    /**
     * Load a BMP image directly.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadBMP_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     *
     * @return a new {@link SDL.Surface.Surface}, or null on error.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadBMP_IO")]
    public static SDL.Surface.Surface ? load_bmp_io (SDL.IOStream.IOStream src);

    /**
     * Load a CUR image directly.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadCUR_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     *
     * @return a new {@link SDL.Surface.Surface}, or null on error.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadCUR_IO")]
    public static SDL.Surface.Surface ? load_cur_io (SDL.IOStream.IOStream src);

    /**
     * Load a GIF image directly.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadGIF_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     *
     * @return a new {@link SDL.Surface.Surface}, or null on error.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadGIF_IO")]
    public static SDL.Surface.Surface ? load_gif_io (SDL.IOStream.IOStream src);

    /**
     * Load a GIF animation directly.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadGIFAnimation_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     *
     * @return a new {@link Animation}, or null on error.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadGIFAnimation_IO")]
    public static Animation ? load_gif_animation_io (SDL.IOStream.IOStream src);

    /**
     * Load an image from a filesystem path into a GPU texture.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadGPUTexture]]
     *
     * @param device the {@link SDL.GPU.GPUDevice} to use to create the
     * GPU texture.
     * @param copy_pass the {@link SDL.GPU.GPUCopyPass} to use to upload
     * the loaded image to the GPU texture.
     * @param file a path on the filesystem to load an image from.
     * @param width a pointer filled in with the width of the GPU texture.
     * may be null.
     * @param height a pointer filled in with the height of the GPU texture.
     * may be null.
     *
     * @return a new {@link SDL.GPU.GPUTexture}, or null on error.
     *
     * @since 3.4.0
     *
     * @see load_gpu_texture_io
     * @see load_gpu_texture_typed_io
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_LoadGPUTexture")]
    public static SDL.GPU.GPUTexture ? load_gpu_texture (SDL.GPU.GPUDevice device,
                                                         SDL.GPU.GPUCopyPass copy_pass,
                                                         string file,
                                                         out int? width,
                                                         out int? height);

    /**
     * Load an image from an SDL data source into a GPU texture.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadGPUTexture_IO]]
     *
     * @param device the {@link SDL.GPU.GPUDevice} to use to create the
     * GPU texture.
     * @param copy_pass the {@link SDL.GPU.GPUCopyPass} to use to upload
     * the loaded image to the GPU texture.
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     * @param close_io true to close/free the SDL_IOStream before returning,
     * false to leave it open.
     * @param width a pointer filled in with the width of the GPU texture.
     * may be null.
     * @param height a pointer filled in with the height of the GPU texture.
     * may be null.
     *
     * @return a new {@link SDL.GPU.GPUTexture}, or null on error.
     *
     * @since 3.4.0
     *
     * @see load_gpu_texture_io
     * @see load_gpu_texture_typed_io
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_LoadGPUTexture_IO")]
    public static SDL.GPU.GPUTexture ? load_gpu_texture_io (SDL.GPU.GPUDevice device,
                                                            SDL.GPU.GPUCopyPass copy_pass,
                                                            SDL.IOStream.IOStream src,
                                                            bool close_io,
                                                            out int? width,
                                                            out int? height);

    /**
     * Load an image from an SDL data source into a GPU texture.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadGPUTextureTyped_IO]]
     *
     * @param device the {@link SDL.GPU.GPUDevice} to use to create the
     * GPU texture.
     * @param copy_pass the {@link SDL.GPU.GPUCopyPass} to use to upload
     * the loaded image to the GPU texture.
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     * @param close_io true to close/free the SDL_IOStream before returning,
     * false to leave it open.
     * @param type a filename extension that represent this data ("BMP",
     * "GIF", "PNG", etc).
     * @param width a pointer filled in with the width of the GPU texture.
     * may be null.
     * @param height a pointer filled in with the height of the GPU texture.
     * may be null.
     *
     * @return a new {@link SDL.GPU.GPUTexture}, or null on error.
     *
     * @since 3.4.0
     *
     * @see load_gpu_texture
     * @see load_gpu_texture_io
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_LoadGPUTextureTyped_IO")]
    public static SDL.Render.Texture ? load_gpu_texture_typed_io (SDL.GPU.GPUDevice device,
                                                                  SDL.GPU.GPUCopyPass copy_pass,
                                                                  SDL.IOStream.IOStream src,
                                                                  bool close_io,
                                                                  string type,
                                                                  out int? width,
                                                                  out int? height);

    /**
     * Load an ICO image directly.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadICO_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     *
     * @return a new {@link SDL.Surface.Surface}, or null on error.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadICO_IO")]
    public static SDL.Surface.Surface ? load_ico_io (SDL.IOStream.IOStream src);

    /**
     * Load a JPG image directly.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadJPG_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     *
     * @return a new {@link SDL.Surface.Surface}, or null on error.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadJPG_IO")]
    public static SDL.Surface.Surface ? load_jpg_io (SDL.IOStream.IOStream src);

    /**
     * Load a JXL image directly.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadJXL_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     *
     * @return a new {@link SDL.Surface.Surface}, or null on error.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadJXL_IO")]
    public static SDL.Surface.Surface ? load_jxl_io (SDL.IOStream.IOStream src);

    /**
     * Load an LBM image directly.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadLBM_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     *
     * @return a new {@link SDL.Surface.Surface}, or null on error.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadLBM_IO")]
    public static SDL.Surface.Surface ? load_lbm_io (SDL.IOStream.IOStream src);

    /**
     * Load a PCX image directly.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadPCX_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     *
     * @return a new {@link SDL.Surface.Surface}, or null on error.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadPCX_IO")]
    public static SDL.Surface.Surface ? load_pcx_io (SDL.IOStream.IOStream src);

    /**
     * Load a PNG image directly.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadPNG_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     *
     * @return a new {@link SDL.Surface.Surface}, or null on error.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadPNG_IO")]
    public static SDL.Surface.Surface ? load_png_io (SDL.IOStream.IOStream src);

    /**
     * Load a PNM image directly.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadPNM_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     *
     * @return a new {@link SDL.Surface.Surface}, or null on error.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadPNM_IO")]
    public static SDL.Surface.Surface ? load_pnm_io (SDL.IOStream.IOStream src);

    /**
     * Load a QOI image directly.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadQOI_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     *
     * @return a new {@link SDL.Surface.Surface}, or null on error.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadQOI_IO")]
    public static SDL.Surface.Surface ? load_qoi_io (SDL.IOStream.IOStream src);

    /**
     * Load an SVG image, scaled to a specific size.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadSizedSVG_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     * @param width a desired width of the generated surface, in pixels.
     * @param height a desired height of the generated surface, in pixels.
     *
     * @return a new {@link SDL.Surface.Surface}, or null on error.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadSizedSVG_IO")]
    public static SDL.Surface.Surface ? load_sized_svg_io (SDL.IOStream.IOStream src, int width, int height);

    /**
     * Load a SVG image directly.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadSVG_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     *
     * @return a new {@link SDL.Surface.Surface}, or null on error.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadSVG_IO")]
    public static SDL.Surface.Surface ? load_svg_io (SDL.IOStream.IOStream src);

    /**
     * Load an image from a filesystem path into a texture.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadTexture]]
     *
     * @param renderer the {@link SDL.Render.Renderer} to use to create the texture
     * @param file a path on the filesystem to load an image from.
     *
     * @return a new {@link SDL.Render.Texture}, or null on error.
     *
     * @since 3.0.0
     *
     * @see load_texture_io
     * @see load_texture_typed_io
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadTexture")]
    public static SDL.Render.Texture ? load_texture (SDL.Render.Renderer renderer, string file);

    /**
     * Load an image from an SDL data source into a texture.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadTexture_IO]]
     *
     * @param renderer the {@link SDL.Render.Renderer} to use to create the texture
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     * @param close_io true to close/free the SDL_IOStream before returning, false to leave it open.
     *
     * @return a new {@link SDL.Render.Texture}, or null on error.
     *
     * @since 3.0.0
     *
     * @see load_texture
     * @see load_texture_typed_io
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadTexture_IO")]
    public static SDL.Render.Texture ? load_texture_io (SDL.Render.Renderer renderer,
                                                        SDL.IOStream.IOStream src,
                                                        bool close_io);

    /**
     * Load an image from an SDL data source into a texture.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadTextureTyped_IO]]
     *
     * @param renderer the {@link SDL.Render.Renderer} to use to create the texture
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     * @param close_io true to close/free the SDL_IOStream before returning, false to leave it open.
     * @param type a filename extension that represent this data ("BMP", "GIF", "PNG", etc).
     *
     *
     * @return a new {@link SDL.Render.Texture}, or null on error.
     *
     * @since 3.0.0
     *
     * @see load_texture
     * @see load_texture_io
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadTextureTyped_IO")]
    public static SDL.Render.Texture ? load_texture_typed_io (SDL.Render.Renderer renderer,
                                                              SDL.IOStream.IOStream src,
                                                              bool close_io,
                                                              string type);

    /**
     * Load a TGA image directly.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadTGA_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     *
     * @return a new {@link SDL.Surface.Surface}, or null on error.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadTGA_IO")]
    public static SDL.Surface.Surface ? load_tga_io (SDL.IOStream.IOStream src);

    /**
     * Load a TIF image directly.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadTIF_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     *
     * @return a new {@link SDL.Surface.Surface}, or null on error.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadTIF_IO")]
    public static SDL.Surface.Surface ? load_tif_io (SDL.IOStream.IOStream src);

    /**
     * Load an image from an SDL data source into a software surface.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadTyped_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     * @param close_io true to close/free the SDL_IOStream before returning, false to leave it open.
     * @param type a filename extension that represent this data ("BMP", "GIF", "PNG", etc).
     *
     * @return a new {@link SDL.Surface.Surface}, or null on error.
     *
     * @since 3.0.0
     *
     * @see load
     * @see load_io
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadTyped_IO")]
    public static SDL.Surface.Surface ? load_typed_io (SDL.IOStream.IOStream src,
                                                       bool close_io,
                                                       string type);

    /**
     * Load a WEBP image directly.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadWEBP_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     *
     * @return a new {@link SDL.Surface.Surface}, or null on error.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadWEBP_IO")]
    public static SDL.Surface.Surface ? load_webp_io (SDL.IOStream.IOStream src);

    /**
     * Load a WEBP animation directly.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadWEBPAnimation_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     *
     * @return a new {@link Animation}, or null on error.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadWEBPAnimation_IO")]
    public static Animation ? load_webp_animation_io (SDL.IOStream.IOStream src);

    /**
     * Load a XCF image directly.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadXCF_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     *
     * @return a new {@link SDL.Surface.Surface}, or null on error.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadXCF_IO")]
    public static SDL.Surface.Surface ? load_xcf_io (SDL.IOStream.IOStream src);

    /**
     * Load a XPM image directly.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadXV_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     *
     * @return a new {@link SDL.Surface.Surface}, or null on error.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadXPM_IO")]
    public static SDL.Surface.Surface ? load_xpm_io (SDL.IOStream.IOStream src);

    /**
     * Load a XV image directly.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_LoadXV_IO]]
     *
     * @param src an {@link SDL.IOStream.IOStream} that data will be read from.
     *
     * @return a new {@link SDL.Surface.Surface}, or null on error.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_LoadXV_IO")]
    public static SDL.Surface.Surface ? load_xv_io (SDL.IOStream.IOStream src);

    /**
     * Load an XPM image from a memory array.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_ReadXPMFromArray]]
     *
     * @param xpm a null-terminated array of strings that comprise XPM data.
     *
     * @return a new {@link SDL.Surface.Surface}, or null on error.
     *
     * @since 3.0.0
     *
     * @see read_xpm_from_array_to_rgb888
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_ReadXPMFromArray")]
    public static SDL.Surface.Surface ? read_xpm_from_array (
        [CCode (array_length = false, array_null_terminated = true)]
        string[] xpm);

    /**
     * Load an XPM image from a memory array.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_ReadXPMFromArray]]
     *
     * @param xpm a null-terminated array of strings that comprise XPM data.
     *
     * @return a new {@link SDL.Surface.Surface}, or null on error.
     *
     * @since 3.0.0
     *
     * @see read_xpm_from_array
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_ReadXPMFromArrayToRGB888")]
    public static SDL.Surface.Surface ? read_xpm_from_array_to_rgb888 (
        [CCode (array_length = false, array_null_terminated = true)]
        string[] xpm);

    /**
     * Reset an animation decoder.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_ResetAnimationDecoder]]
     *
     * @param decoder the animation decoder to reset
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see create_animation_decoder
     * @see create_animation_decoder_io
     * @see create_animation_decoder_with_properties
     * @see get_animation_decoder_frame
     * @see close_animation_decoder
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_ResetAnimationDecoder")]
    public static bool reset_animation_decoder (AnimationDecoder decoder);

    /**
     * Save an {@link SDL.Surface.Surface} into an image file.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_Save]]
     *
     * @param surface the {@link SDL.Surface.Surface} to save.
     * @param file path on the filesystem to write new file to.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_Save")]
    public static bool save (SDL.Surface.Surface surface, string file);

    /**
     * Save an animation in ANI format to an {@link SDL.IOStream.IOStream}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_SaveANIAnimation_IO]]
     *
     * @param anim the animation to save.
     * @param dst an {@link SDL.IOStream.IOStream} from which data will be
     * written to.
     * @param close_io true to close/free the {@link SDL.IOStream.IOStream}
     * before returning, false to leave it open.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_SaveANIAnimation_IO")]
    public static bool save_ani_animation_io (Animation anim,
                                              SDL.IOStream.IOStream dst,
                                              bool close_io);

    /**
     * Save an animation to a file.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_SaveAnimation]]
     *
     * @param anim the animation to save.
     * @param file path on the filesystem containing an animated image.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_SaveAnimation")]
    public static bool save_animation (Animation anim, string file);

    /**
     * Save an animation to an {@link SDL.IOStream.IOStream}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_SaveAnimationTyped_IO]]
     *
     * @param anim the animation to save.
     * @param dst an {@link SDL.IOStream.IOStream} from which data will be
     * written to.
     * @param close_io true to close/free the {@link SDL.IOStream.IOStream}
     * before returning, false to leave it open.
     * @param type a filename extension that represent this data ("GIF", etc).
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_SaveAnimationTyped_IO")]
    public static bool save_animation_typed_io (Animation anim,
                                                SDL.IOStream.IOStream dst,
                                                bool close_io,
                                                string type);

    /**
     * Save an animation in APNG format to an {@link SDL.IOStream.IOStream}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_SaveAPNGAnimation_IO]]
     *
     * @param anim the animation to save.
     * @param dst an {@link SDL.IOStream.IOStream} from which data will be
     * written to.
     * @param close_io true to close/free the {@link SDL.IOStream.IOStream}
     * before returning, false to leave it open.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_SaveAPNGAnimation_IO")]
    public static bool save_apng_animation_io (Animation anim,
                                               SDL.IOStream.IOStream dst,
                                               bool close_io);

    /**
     * Save an {@link SDL.Surface.Surface} into an AVIF image file.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_SaveAVIF]]
     *
     * @param surface the SDL surface to save.
     * @param file path on the filesystem to write new file to.
     * @param quality the desired quality, ranging between 0 (lowest) and 100 (highest).
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see save_avif_io
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_SaveAVIF")]
    public static bool save_avif (SDL.Surface.Surface surface, string file, int quality);

    /**
     * Save an {@link SDL.Surface.Surface} into AVIF image data, via an
     * {@link SDL.IOStream.IOStream}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_SaveAVIF_IO]]
     *
     * @param surface the SDL surface to save.
     * @param dst the {@link SDL.IOStream.IOStream} to save the image data to.
     * @param close_io true to close/free the SDL_IOStream before returning, false to leave it open.
     * @param quality the desired quality, ranging between 0 (lowest) and 100 (highest).
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see save_avif
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_SaveAVIF_IO")]
    public static bool save_avif_io (SDL.Surface.Surface surface,
                                     SDL.IOStream.IOStream dst,
                                     bool close_io,
                                     int quality);

    /**
     * Save an animation in AVIF format to an {@link SDL.IOStream.IOStream}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_SaveAVIFAnimation_IO]]
     *
     * @param anim the animation to save.
     * @param dst an {@link SDL.IOStream.IOStream} from which data will be
     * written to.
     * @param close_io true to close/free the {@link SDL.IOStream.IOStream}
     * before returning, false to leave it open.
     * @param quality the desired quality, ranging between 0 (lowest) and
     * 100 (highest).
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_SaveAVIFAnimation_IO")]
    public static bool save_avif_animation_io (Animation anim,
                                               SDL.IOStream.IOStream dst,
                                               bool close_io,
                                               int quality);

    /**
     * Save an {@link SDL.Surface.Surface} into a BMP image file.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_SaveBMP]]
     *
     * @param surface the SDL surface to save.
     * @param file path on the filesystem to write new file to.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see save_bmp_io
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_SaveBMP")]
    public static bool save_bmp (SDL.Surface.Surface surface, string file);

    /**
     * Save an {@link SDL.Surface.Surface} into BMP image data, via an
     * {@link SDL.IOStream.IOStream}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_SaveBMP_IO]]
     *
     * @param surface the SDL surface to save.
     * @param dst the {@link SDL.IOStream.IOStream} to save the image data to.
     * @param close_io true to close/free the SDL_IOStream before returning,
     * false to leave it open.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see save_bmp
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_SaveBMP_IO")]
    public static bool save_bmp_io (SDL.Surface.Surface surface,
                                    SDL.IOStream.IOStream dst,
                                    bool close_io);

    /**
     * Save an {@link SDL.Surface.Surface} into a CUR image file.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_SaveCUR]]
     *
     * @param surface the SDL surface to save.
     * @param file path on the filesystem to write new file to.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see save_cur_io
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_SaveCUR")]
    public static bool save_cur (SDL.Surface.Surface surface, string file);

    /**
     * Save an {@link SDL.Surface.Surface} into CUR image data, via an
     * {@link SDL.IOStream.IOStream}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_SaveCUR_IO]]
     *
     * @param surface the SDL surface to save.
     * @param dst the {@link SDL.IOStream.IOStream} to save the image data to.
     * @param close_io true to close/free the SDL_IOStream before returning,
     * false to leave it open.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see save_cur
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_SaveCUR_IO")]
    public static bool save_cur_io (SDL.Surface.Surface surface,
                                    SDL.IOStream.IOStream dst,
                                    bool close_io);

    /**
     * Save an {@link SDL.Surface.Surface} into a GIF image file.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_SaveGIF]]
     *
     * @param surface the SDL surface to save.
     * @param file path on the filesystem to write new file to.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see save_gif_io
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_SaveGIF")]
    public static bool save_gif (SDL.Surface.Surface surface, string file);

    /**
     * Save an {@link SDL.Surface.Surface} into GIF image data, via an
     * {@link SDL.IOStream.IOStream}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_SaveGIF_IO]]
     *
     * @param surface the SDL surface to save.
     * @param dst the {@link SDL.IOStream.IOStream} to save the image data to.
     * @param close_io true to close/free the SDL_IOStream before returning,
     * false to leave it open.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see save_gif
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_SaveGIF_IO")]
    public static bool save_gif_io (SDL.Surface.Surface surface,
                                    SDL.IOStream.IOStream dst,
                                    bool close_io);

    /**
     * Save an animation in GIF format to an {@link SDL.IOStream.IOStream}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_SaveGIFAnimation_IO]]
     *
     * @param anim the animation to save.
     * @param dst an {@link SDL.IOStream.IOStream} from which data will be
     * written to.
     * @param close_io true to close/free the {@link SDL.IOStream.IOStream}
     * before returning, false to leave it open.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_SaveGIFAnimation_IO")]
    public static bool save_gif_animation_io (Animation anim,
                                              SDL.IOStream.IOStream dst,
                                              bool close_io);

    /**
     * Save an {@link SDL.Surface.Surface} into an ICO image file.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_SaveICO]]
     *
     * @param surface the SDL surface to save.
     * @param file path on the filesystem to write new file to.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see save_ico_io
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_SaveICO")]
    public static bool save_ico (SDL.Surface.Surface surface, string file);

    /**
     * Save an {@link SDL.Surface.Surface} into ICO image data, via an
     * {@link SDL.IOStream.IOStream}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_SaveICO_IO]]
     *
     * @param surface the SDL surface to save.
     * @param dst the {@link SDL.IOStream.IOStream} to save the image data to.
     * @param close_io true to close/free the SDL_IOStream before returning,
     * false to leave it open.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see save_ico
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_SaveICO_IO")]
    public static bool save_ico_io (SDL.Surface.Surface surface,
                                    SDL.IOStream.IOStream dst,
                                    bool close_io);

    /**
     * Save an {@link SDL.Surface.Surface} into a JPG image file.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_SaveJPG]]
     *
     * @param surface the SDL surface to save.
     * @param file path on the filesystem to write new file to.
     * @param quality the desired quality, ranging between 0 (lowest) and 100 (highest).
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see save_jpg_io
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_SaveJPG")]
    public static bool save_jpg (SDL.Surface.Surface surface, string file, int quality);

    /**
     * Save an {@link SDL.Surface.Surface} into JPG image data, via an {@link SDL.IOStream.IOStream}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_SaveJPG_IO]]
     *
     * @param surface the SDL surface to save.
     * @param dst the {@link SDL.IOStream.IOStream} to save the image data to.
     * @param close_io true to close/free the SDL_IOStream before returning, false to leave it open.
     * @param quality the desired quality, ranging between 0 (lowest) and 100 (highest).
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see save_jpg
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_SaveJPG_IO")]
    public static bool save_jpg_io (SDL.Surface.Surface surface,
                                    SDL.IOStream.IOStream dst,
                                    bool close_io,
                                    int quality);

    /**
     * Save an {@link SDL.Surface.Surface} into a PNG image file.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_SaveJPG]]
     *
     * @param surface the SDL surface to save.
     * @param file path on the filesystem to write new file to.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see save_png_io
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_SavePNG")]
    public static bool save_png (SDL.Surface.Surface surface, string file);

    /**
     * Save an {@link SDL.Surface.Surface} into PNG image data,
     * via an {@link SDL.IOStream.IOStream}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_SaveJPG_IO]]
     *
     * @param surface the SDL surface to save.
     * @param dst the {@link SDL.IOStream.IOStream} to save the image data to.
     * @param close_io true to close/free the SDL_IOStream before returning, false to leave it open.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see save_png
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_SavePNG_IO")]
    public static bool save_png_io (SDL.Surface.Surface surface,
                                    SDL.IOStream.IOStream dst,
                                    bool close_io);

    /**
     * Save an {@link SDL.Surface.Surface} into an TGA image file.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_SaveTGA]]
     *
     * @param surface the SDL surface to save.
     * @param file path on the filesystem to write new file to.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see save_tga_io
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_SaveTGA")]
    public static bool save_tga (SDL.Surface.Surface surface, string file);

    /**
     * Save an {@link SDL.Surface.Surface} into TGA image data,
     * via an {@link SDL.IOStream.IOStream}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_SaveTGA_IO]]
     *
     * @param surface the SDL surface to save.
     * @param dst the {@link SDL.IOStream.IOStream} to save the image data to.
     * @param close_io true to close/free the SDL_IOStream before returning, false to leave it open.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see save_tga
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_SaveTGA_IO")]
    public static bool save_tga_io (SDL.Surface.Surface surface,
                                    SDL.IOStream.IOStream dst,
                                    bool close_io);

    /**
     * Save an {@link SDL.Surface.Surface} into into formatted image data,
     * via an {@link SDL.IOStream.IOStream}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_SaveTyped_IO]]
     *
     * @param surface the SDL surface to save.
     * @param dst the {@link SDL.IOStream.IOStream} to save the image data to.
     * @param close_io true to close/free the SDL_IOStream before returning,
     * false to leave it open.
     * @param type a filename extension that represent this data ("BMP", "GIF",
     * "PNG", etc).
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_SaveTyped_IO")]
    public static bool save_typed_io (SDL.Surface.Surface surface,
                                      SDL.IOStream.IOStream dst,
                                      bool close_io,
                                      string type);

    /**
     * Save an {@link SDL.Surface.Surface} into an WEBP image file.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_SaveWEBP]]
     *
     * @param surface the SDL surface to save.
     * @param file path on the filesystem to write new file to.
     * @param quality between 0 and 100. For lossy, 0 gives the smallest size
     * and 100 the largest. For lossless, this parameter is the amount of
     * effort put into the compression: 0 is the fastest but gives larger
     * files compared to the slowest, but best, 100.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see save_tga_io
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_SaveWEBP")]
    public static bool save_webp (SDL.Surface.Surface surface, string file, float quality);

    /**
     * Save an {@link SDL.Surface.Surface} into WEBP image data,
     * via an {@link SDL.IOStream.IOStream}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_SaveWEBP_IO]]
     *
     * @param surface the SDL surface to save.
     * @param dst the {@link SDL.IOStream.IOStream} to save the image data to.
     * @param close_io true to close/free the SDL_IOStream before returning, false to leave it open.
     * @param quality between 0 and 100. For lossy, 0 gives the smallest size
     * and 100 the largest. For lossless, this parameter is the amount of
     * effort put into the compression: 0 is the fastest but gives larger
     * files compared to the slowest, but best, 100.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     *
     * @see save_webp
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_SaveWEBP_IO")]
    public static bool save_webp_io (SDL.Surface.Surface surface,
                                     SDL.IOStream.IOStream dst,
                                     bool close_io,
                                     float quality);

    /**
     * Save an animation in WEBP format to an {@link SDL.IOStream.IOStream}.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_SaveWEBPAnimation_IO]]
     *
     * @param anim the animation to save.
     * @param dst an {@link SDL.IOStream.IOStream} from which data will be
     * written to.
     * @param close_io true to close/free the {@link SDL.IOStream.IOStream}
     * before returning, false to leave it open.
     * @param quality between 0 and 100. For lossy, 0 gives the smallest size
     * and 100 the largest. For lossless, this parameter is the amount of
     * effort put into the compression: 0 is the fastest but gives larger
     * files compared to the slowest, but best, 100.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.4.0
     */
    [Version (since = "3.4.0")]
    [CCode (cname = "IMG_SaveWEBPAnimation_IO")]
    public static bool save_webp_animation_io (Animation anim,
                                               SDL.IOStream.IOStream dst,
                                               bool close_io,
                                               int quality);

    /**
     * This function gets the version of the dynamically linked SDL_image library.
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_Version]]
     *
     * @return the linked {@link SDL.Image} version
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "IMG_Version")]
    public static int version ();

    /**
     * The SDL3 Image MAJOR_VERSION constant. The first part of the
     * printable format: "%d.%d.%d", MAJOR, MINOR, MICRO.
     *
     *   * [[https://wiki.libsdl.org/SDL3_image/SDL_IMAGE_MAJOR_VERSION/]]
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "SDL_IMAGE_MAJOR_VERSION")]
    public const int MAJOR_VERSION;

    /**
     * The SDL3 Image MINOR_VERSION constant. The second part of the
     * printable format: "%d.%d.%d", MAJOR, MINOR, MICRO.
     *
     *   * [[https://wiki.libsdl.org/SDL3_image/SDL_IMAGE_MINOR_VERSION/]]
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "SDL_IMAGE_MINOR_VERSION")]
    public const int MINOR_VERSION;

    /**
     * The SDL3 Image MICRO_VERSION constant. The third part of the
     * printable format: "%d.%d.%d", MAJOR, MINOR, MICRO.
     *
     *   * [[https://wiki.libsdl.org/SDL3_image/SDL_IMAGE_MICRO_VERSION]]
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "SDL_IMAGE_MICRO_VERSION")]
    public const int MICRO_VERSION;

    /**
     * This is the version number macro for the current SDL_image version. In
     * printable format: "%d.%d.%d", MAJOR, MINOR, MICRO.
     *
     *   * [[https://wiki.libsdl.org/SDL3_image/SDL_IMAGE_VERSION]]
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "SDL_IMAGE_VERSION")]
    public const int VERSION;

    /**
     * This macro will evaluate to true if compiled with SDL_image at least X.Y.Z.
     *
     *   * [[https://wiki.libsdl.org/SDL3_image/SDL_IMAGE_VERSION_ATLEAST]]
     *
     * @param major the major version number.
     * @param minor the minor version number.
     * @param micro the micro version number.
     *
     * @return true if the SDL3 Image version is at least '''major.minor.micro''',
     * false otherwise.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "SDL_IMAGE_VERSION_ATLEAST")]
    public static bool version_at_least (int major, int minor, int micro);

    /**
     * Properties used in {@link create_animation_encoder_with_properties}
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationEncoderWithProperties]]
     *
     */
    namespace PropAnimationEncoderCreate {
        /**
         * The file to load, if an {@link SDL.IOStream.IOStream} isn't being
         * used. This is required if
         * {@link PropAnimationEncoderCreate.IOSTREAM_POINTER} isn't set.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationEncoderWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_ENCODER_CREATE_FILENAME_STRING")]
        public const string FILENAME_STRING;

        /**
         * An {@link SDL.IOStream.IOStream} containing a series of images.
         * This should not be closed until the animation decoder is closed.
         * This is required if
         * {@link PropAnimationEncoderCreate.FILENAME_STRING} isn't set.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationEncoderWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_ENCODER_CREATE_IOSTREAM_POINTER")]
        public const string IOSTREAM_POINTER;

        /**
         * True if closing the animation decoder should also close the
         * associated {@link SDL.IOStream.IOStream}.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationEncoderWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_ENCODER_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN")]
        public const string IOSTREAM_AUTOCLOSE_BOOLEAN;

        /**
         * The input file type, e.g. "webp", defaults to the file extension
         * if {@link PropAnimationEncoderCreate.FILENAME_STRING} is set.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationEncoderWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_ENCODER_CREATE_TYPE_STRING")]
        public const string TYPE_STRING;

        /**
         * The compression quality, in the range of 0 to 100. The higher
         * the number, the higher the quality and file size. This defaults
         * to a balanced value for compression and quality.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationEncoderWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_ENCODER_CREATE_QUALITY_NUMBER")]
        public const string CREATE_QUALITY_NUMBER;
        /**
         * The numerator of the fraction used to multiply the pts to convert
         * it to seconds. This defaults to 1.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationEncoderWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_ENCODER_CREATE_TIMEBASE_NUMERATOR_NUMBER")]
        public const string TIMEBASE_NUMERATOR_NUMBER;

        /**
         * The denominator of the fraction used to multiply the pts to convert
         * it to seconds. This defaults to 1000.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationEncoderWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_ENCODER_CREATE_TIMEBASE_DENOMINATOR_NUMBER")]
        public const string TIMEBASE_DENOMINATOR_NUMBER;

        /**
         * Maximun number of threads to decode an AVIV format. Only works if
         * the image format is AVIF.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationEncoderWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_ENCODER_CREATE_AVIF_MAX_THREADS_NUMBER")]
        public const string AVIF_MAX_THREADS_NUMBER;

        /**
         * The keyframe interval to use when enciding an AVIF file. Only works
         * if the image format is AVIF.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationEncoderWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_ENCODER_CREATE_AVIF_KEYFRAME_INTERVAL_NUMBER")]
        public const string AVIF_KEYFRAME_INTERVAL_NUMBER;

        /**
         * Whther to use a LUT (look-up table) to encide a GIF file. Only works
         * if the image format is GIF.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationEncoderWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_ENCODER_CREATE_GIF_USE_LUT_BOOLEAN")]
        public const string GIF_USE_LUT_BOOLEAN;
    }

    /**
     * Properties used in {@link create_animation_decoder_with_properties}
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationDecoderWithProperties]]
     *
     */
    namespace PropAnimationDecoderCreate {
        /**
         * The file to load, if an {@link SDL.IOStream.IOStream} isn't being
         * used. This is required if
         * {@link PropAnimationDecoderCreate.IOSTREAM_POINTER} isn't set.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationDecoderWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_DECODER_CREATE_FILENAME_STRING")]
        public const string FILENAME_STRING;

        /**
         * An {@link SDL.IOStream.IOStream} containing a series of images.
         * This should not be closed until the animation decoder is closed.
         * This is required if
         * {@link PropAnimationDecoderCreate.FILENAME_STRING} isn't set.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationDecoderWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_DECODER_CREATE_IOSTREAM_POINTER")]
        public const string IOSTREAM_POINTER;

        /**
         * True if closing the animation decoder should also close the
         * associated {@link SDL.IOStream.IOStream}.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationDecoderWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_DECODER_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN")]
        public const string IOSTREAM_AUTOCLOSE_BOOLEAN;

        /**
         * The input file type, e.g. "webp", defaults to the file extension
         * if {@link PropAnimationDecoderCreate.FILENAME_STRING} is set.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationDecoderWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_DECODER_CREATE_TYPE_STRING")]
        public const string TYPE_STRING;

        /**
         * The numerator of the fraction used to multiply the pts to convert
         * it to seconds. This defaults to 1.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationDecoderWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_DECODER_CREATE_TIMEBASE_NUMERATOR_NUMBER")]
        public const string TIMEBASE_NUMERATOR_NUMBER;

        /**
         * The denominator of the fraction used to multiply the pts to convert
         * it to seconds. This defaults to 1000.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationDecoderWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_DECODER_CREATE_TIMEBASE_DENOMINATOR_NUMBER")]
        public const string TIMEBASE_DENOMINATOR_NUMBER;

        /**
         * Maximun number of threads to decode an AVIV format. Only works if
         * the image format is AVIF.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationDecoderWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_DECODER_CREATE_AVIF_MAX_THREADS_NUMBER")]
        public const string AVIF_MAX_THREADS_NUMBER;

        /**
         * Whether to allow incremental decoding an AVIV format. Only works if
         * the image format is AVIF.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationDecoderWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_DECODER_CREATE_AVIF_ALLOW_INCREMENTAL_BOOLEAN")]
        public const string AVIF_ALLOW_INCREMENTAL_BOOLEAN;

        /**
         * Whether to allow progessive decoding an AVIV format. Only works if
         * the image format is AVIF.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationDecoderWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_DECODER_CREATE_AVIF_ALLOW_PROGRESSIVE_BOOLEAN")]
        public const string AVIF_ALLOW_PROGRESSIVE_BOOLEAN;

        /**
         * The color index that mark the GIF file as transparent. Only works if
         * the image format is GIF.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationDecoderWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_DECODER_CREATE_GIF_TRANSPARENT_COLOR_INDEX_NUMBER")]
        public const string GIF_TRANSPARENT_COLOR_INDEX_NUMBER;

        /**
         * The amount of colors that the GIF file has. Only works if
         * the image format is GIF.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationDecoderWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_DECODER_CREATE_GIF_NUM_COLORS_NUMBER")]
        public const string GIF_NUM_COLORS_NUMBER;
    }

    /**
     * Properties used in {@link create_animation_stream_with_properties}
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationStreamWithProperties]]
     *
     */
    namespace PropAnimationStreamCreate {
        /**
         * The file to load, if an {@link SDL.IOStream.IOStream} isn't being
         * used. This is required if
         * {@link PropAnimationStreamCreate.IOSTREAM_POINTER} isn't set.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationStreamWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_STREAM_CREATE_FILENAME_STRING")]
        public const string FILENAME_STRING;

        /**
         * An {@link SDL.IOStream.IOStream} containing a series of images.
         * This should not be closed until the animation decoder is closed.
         * This is required if
         * {@link PropAnimationStreamCreate.FILENAME_STRING} isn't set.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationStreamWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_STREAM_CREATE_IOSTREAM_POINTER")]
        public const string IOSTREAM_POINTER;

        /**
         * True if closing the animation decoder should also close the
         * associated {@link SDL.IOStream.IOStream}.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationStreamWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_STREAM_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN")]
        public const string IOSTREAM_AUTOCLOSE_BOOLEAN;

        /**
         * The input file type, e.g. "webp", defaults to the file extension
         * if {@link PropAnimationStreamCreate.FILENAME_STRING} is set.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationStreamWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_STREAM_CREATE_TYPE_STRING")]
        public const string TYPE_STRING;

        /**
         * The compression quality, in the range of 0 to 100. The higher
         * the number, the higher the quality and file size. This defaults
         * to a balanced value for compression and quality.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationStreamWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_STREAM_CREATE_QUALITY_NUMBER")]
        public const string CREATE_QUALITY_NUMBER;
        /**
         * The numerator of the fraction used to multiply the pts to convert
         * it to seconds. This defaults to 1.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationStreamWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_STREAM_CREATE_TIMEBASE_NUMERATOR_NUMBER")]
        public const string TIMEBASE_NUMERATOR_NUMBER;

        /**
         * The denominator of the fraction used to multiply the pts to convert
         * it to seconds. This defaults to 1000.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_CreateAnimationStreamWithProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_ANIMATION_STREAM_CREATE_TIMEBASE_DENOMINATOR_NUMBER")]
        public const string TIMEBASE_DENOMINATOR_NUMBER;
    }

    /**
     * Properties used in {@link get_animation_decoder_metadata}
     * and {@link get_animation_decoder_properties}
     *
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_GetAnimationDecoderMetadata]]
     *  * [[https://wiki.libsdl.org/SDL3_image/IMG_GetAnimationDecoderProperties]]
     *
     */
    namespace PropAnimationDecoderMetadata {
        /**
         * Whether this image will ignore prop metadata assignment.
         * If you don't need any internal metadata set this to true.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_GetAnimationDecoderMetadata]]
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_GetAnimationDecoderProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_METADATA_IGNORE_PROPS_BOOLEAN")]
        public const string IGNORE_PROPS_BOOLEAN;

        /**
         * Description string of the image
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_GetAnimationDecoderMetadata]]
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_GetAnimationDecoderProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_METADATA_DESCRIPTION_STRING")]
        public const string DESCRIPTION_STRING;

        /**
         * Copyright string of the image
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_GetAnimationDecoderMetadata]]
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_GetAnimationDecoderProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_METADATA_COPYRIGHT_STRING")]
        public const string COPYRIGHT_STRING;

        /**
         * Title of the image
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_GetAnimationDecoderMetadata]]
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_GetAnimationDecoderProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_METADATA_TITLE_STRING")]
        public const string TITLE_STRING;

        /**
         * Author of the image
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_GetAnimationDecoderMetadata]]
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_GetAnimationDecoderProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_METADATA_AUTHOR_STRING")]
        public const string AUTHOR_STRING;

        /**
         * Creation time of the image
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_GetAnimationDecoderMetadata]]
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_GetAnimationDecoderProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_METADATA_CREATION_TIME_STRING")]
        public const string CREATION_TIME_STRING;

        /**
         * The number of frames in the animation.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_GetAnimationDecoderMetadata]]
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_GetAnimationDecoderProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_METADATA_FRAME_COUNT_NUMBER")]
        public const string FRAME_COUNT_NUMBER;


        /**
         * The amount of loops the animation will perform. A value of 0
         * means it will loop forever.
         *
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_GetAnimationDecoderMetadata]]
         *  * [[https://wiki.libsdl.org/SDL3_image/IMG_GetAnimationDecoderProperties]]
         *
         * @since 3.4.0
         */
        [Version (since = "3.4.0")]
        [CCode (cname = "IMG_PROP_METADATA_LOOP_COUNT_NUMBER")]
        public const string LOOP_COUNT_NUMBER;

    }

} // SDL.Image
