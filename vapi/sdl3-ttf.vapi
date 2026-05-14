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
 * https://wiki.libsdl.org/SDL3_ttf/CategoryAPI
 */

/**
 * ''The SDL3 TTF Library Vala bindings''
 *
 * This library is a wrapper around the FreeType and Harfbuzz libraries,
 * allowing you to use TrueType fonts to render text in SDL applications.
 *
 *  * ''C-Documentation reference:'' [[https://wiki.libsdl.org/SDL3_ttf]]
 *
 */
[CCode (cheader_filename = "SDL3_ttf/SDL_ttf.h")]
namespace SDL.TTF {
    /**
     * The SDL3 TTF MAJOR_VERSION constant. The first part of the
     * printable format: "%d.%d.%d", MAJOR, MINOR, MICRO.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/SDL_TTF_MAJOR_VERSION]]
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "SDL_TTF_MAJOR_VERSION")]
    public const int MAJOR_VERSION;

    /**
     * The SDL3 TTF MINOR_VERSION constant. The second part of the
     * printable format: "%d.%d.%d", MAJOR, MINOR, MICRO.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/SDL_TTF_MINOR_VERSION]]
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "SDL_TTF_MINOR_VERSION")]
    public const int MINOR_VERSION;

    /**
     * The SDL3 TTF MICRO_VERSION constant. The third part of the
     * printable format: "%d.%d.%d", MAJOR, MINOR, MICRO.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/SDL_TTF_MICRO_VERSION]]
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "SDL_TTF_MICRO_VERSION")]
    public const int MICRO_VERSION;

    /**
     * This is the version number macro for the current SDL_ttf version. In
     * printable format: "%d.%d.%d", MAJOR, MINOR, MICRO.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/SDL_TTF_MAJOR_VERSION]]
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "SDL_TTF_VERSION")]
    public const int VERSION;

    /**
     * This macro will evaluate to true if compiled with SDL_ttf at least X.Y.Z.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/SDL_TTF_VERSION_ATLEAST]]
     *
     * @param major the major version number.
     * @param minor the minor version number.
     * @param micro the micro version number.
     *
     * @return true if the SDL3 TTF version is at least '''major.minor.micro''',
     * false otherwise.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "SDL_TTF_VERSION_ATLEAST")]
    public static bool version_at_least (int major, int minor, int micro);

    /**
     * Add a fallback font.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_AddFallbackFont]]
     * @param font the {@link Font} to modify.
     * @param fallback the {@link Font} to add as a fallback.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see clear_fallback_fonts
     * @see remove_fallback_font
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_AddFallbackFont")]
    public static bool add_fallback_font (Font font, Font fallback);

    /**
     * Append UTF-8 text to a text object.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_AppendTextString]]
     *
     * @param text the {@link Text} to modify.
     * @param text_to_append the UTF-8 text to insert.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see delete_text_string
     * @see insert_text_string
     * @see set_text_string
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_AppendTextString")]
    public static bool append_text_string (Text text, string text_to_append);

    /**
     * Remove all fallback fonts.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_ClearFallbackFonts]]
     *
     * @param font the {@link Font} to modify.
     *
     * @since 3.0.0
     *
     * @see add_fallback_font
     * @see remove_fallback_font
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_ClearFallbackFonts")]
    public static void clear_fallback_fonts (Font font);

    /**
     * Dispose of a previously-created font.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_CloseFont]]
     *
     * @param font the {@link Font} to dispose of.
     *
     * @since 3.0.0
     *
     * @see open_font
     * @see open_font_io
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_CloseFont")]
    public static void close_font (Font font);

    /**
     * Create a copy of an existing font.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_CopyFont]]
     *
     * @param existing_font the {@link Font} to copy.
     *
     * @return a valid {@link Font}, or null on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see close_font
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_CopyFont")]
    public static Font ? copy_font (Font existing_font);

    /**
     * Create a text engine for drawing text with the SDL GPU API.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_CreateGPUTextEngine]]
     *
     * @param device the {@link SDL.GPU.GPUDevice} to use for creating textures
     * and drawing text.
     *
     * @return a {@link TextEngine} object or null on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see create_gpu_text_engine_with_properties
     * @see destroy_gpu_text_engine
     * @see get_gpu_text_draw_data
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_CreateGPUTextEngine")]
    public static TextEngine ? create_gpu_text_engine (SDL.GPU.GPUDevice device);

    /**
     * Create a text engine for drawing text with the SDL GPU API, with the specified properties.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_CreateGPUTextEngineWithProperties]]
     *
     * @param props the {@link SDL.Properties.PropertiesID} to use.
     *
     * @return a {@link TextEngine} object or null on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see create_renderer_text_engine
     * @see destroy_renderer_text_engine
     * @see draw_renderer_text
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_CreateGPUTextEngineWithProperties")]
    public static TextEngine ? create_gpu_text_engine_with_properties (SDL.Properties.PropertiesID props);

    /**
     * Create a text engine for drawing text on an SDL renderer.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_CreateRendererTextEngine]]
     *
     * @param renderer the {@link SDL.Render.Renderer} to use for creating textures
     * and drawing text.
     *
     * @return a {@link TextEngine} object or null on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see destroy_renderer_text_engine
     * @see draw_renderer_text
     * @see create_renderer_text_engine_with_properties
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_CreateRendererTextEngine")]
    public static TextEngine ? create_renderer_text_engine (SDL.Render.Renderer renderer);

    /**
     * Create a text engine for drawing text on an SDL renderer, with the specified properties.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_CreateRendererTextEngineWithProperties]]
     *
     * @param props the {@link SDL.Properties.PropertiesID} to use.
     *
     * @return a {@link TextEngine} object or null on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see create_renderer_text_engine
     * @see destroy_renderer_text_engine
     * @see draw_renderer_text
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_CreateRendererTextEngineWithProperties")]
    public static TextEngine ? create_renderer_text_engine_with_properties (SDL.Properties.PropertiesID props);

    /**
     * Create a text engine for drawing text on SDL surfaces.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_CreateSurfaceTextEngine]]
     *
     * @return a {@link TextEngine} object or null on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see destroy_surface_text_engine
     * @see draw_surface_text
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_CreateSurfaceTextEngine")]
    public static TextEngine ? create_surface_text_engine ();

    /**
     * Create a text object from UTF-8 text and a text engine.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_CreateText]]
     *
     * @param engine the text engine to use when creating the text object, may be null.
     * @param font the font to render with.
     * @param text the text to use, in UTF-8 encoding.
     * @param length the length of the text, in bytes, or 0 for null terminated text.
     *
     * @return a {@link Text} object or null on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see destroy_text
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_CreateText")]
    public static Text ? create_text (TextEngine? engine, Font font, string text, size_t length);

    /**
     * Delete UTF-8 text from a text object.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_DeleteTextString]]
     *
     * @param text the {@link Text} to modify.
     * @param offset the offset, in bytes, from the beginning of the string if >= 0,
     * the offset from the end of the string if < 0. Note that this does not do UTF-8
     * validation, so you should only delete at UTF-8 sequence boundaries.
     * @param length the length of text to delete, in bytes, or -1 for the remainder
     * of the string.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see append_text_string
     * @see insert_text_string
     * @see set_text_string
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_DeleteTextString")]
    public static bool delete_text_string (Text text, int offset, int length);

    /**
     * Destroy a text engine created for drawing text with the SDL GPU API.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_DestroyGPUTextEngine]]
     *
     * @param engine a {@link TextEngine} object created with {@link create_gpu_text_engine}.
     *
     * @since 3.0.0
     *
     * @see create_gpu_text_engine
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_DestroyGPUTextEngine")]
    public static void destroy_gpu_text_engine (TextEngine engine);

    /**
     * Destroy a text engine created for drawing text on an SDL renderer.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_DestroyRendererTextEngine]]
     *
     * @param engine a {@link TextEngine} object created with {@link create_renderer_text_engine}.
     *
     * @since 3.0.0
     *
     * @see create_renderer_text_engine
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_DestroyRendererTextEngine")]
    public static void destroy_renderer_text_engine (TextEngine engine);

    /**
     * Destroy a text engine created for drawing text on SDL surfaces.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_DestroySurfaceTextEngine]]
     *
     * @param engine a {@link TextEngine} object created with {@link create_surface_text_engine}.
     *
     * @since 3.0.0
     *
     * @see create_surface_text_engine
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_DestroySurfaceTextEngine")]
    public static void destroy_surface_text_engine (TextEngine engine);

    /**
     * Destroy a text object created by a text engine.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_DestroyText]]
     *
     * @param text the text to destroy.
     *
     * @since 3.0.0
     *
     * @see create_text
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_DestroyText")]
    public static void destroy_text (Text text);

    /**
     * Draw text to an SDL renderer.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_DrawRendererText]]
     *
     * @param text the {@link Text} to draw.
     * @param x the x coordinate in pixels, positive from the left edge towards the right.
     * @param y the y coordinate in pixels, positive from the top edge towards the bottom.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see create_renderer_text_engine
     * @see create_text
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_DrawRendererText")]
    public static bool draw_renderer_text (Text text, float x, float y);

    /**
     * Draw text to an SDL surface.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_DrawSurfaceText]]
     *
     * @param text the {@link Text} to draw.
     * @param x the x coordinate in pixels, positive from the left edge towards the right.
     * @param y the y coordinate in pixels, positive from the top edge towards the bottom.
     * @param surface the surface to draw on.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see create_surface_text_engine
     * @see create_text
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_DrawSurfaceText")]
    public static bool draw_surface_text (Text text, int x, int y, SDL.Surface.Surface surface);

    /**
     * Check whether a glyph is provided by the font for a UNICODE codepoint.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_FontHasGlyph]]
     *
     * @param font the {@link Font} to query.
     * @param ch the codepoint to check.
     *
     * @return true if the font provides a glyph for this character, false if not.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_FontHasGlyph")]
    public static bool font_has_glyph (Font font, uint32 ch);

    /**
     * Query whether a font is fixed-width.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_FontIsFixedWidth]]
     *
     * @param font the {@link Font} to query.
     *
     * @return true if the font is fixed-width, false otherwise.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_FontIsFixedWidth")]
    public static bool font_is_fixed_width (Font font);

    /**
     * Query whether a font is scalable or not.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_FontIsScalable]]
     *
     * @param font the {@link Font} to query.
     *
     * @return true if the font is scalable, false otherwise.
     *
     * @since 3.0.0
     *
     * @see set_font_sdf
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_FontIsScalable")]
    public static bool font_is_scalable (Font font);

    /**
     * Query the offset from the baseline to the top of a font.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetFontAscent]]
     *
     * @param font the {@link Font} to query.
     *
     * @return the font's ascent.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetFontAscent")]
    public static int get_font_ascent (Font font);

    /**
     * Query the offset from the baseline to the bottom of a font.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetFontDescent]]
     *
     * @param font the {@link Font} to query.
     *
     * @return the font's descent.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetFontDescent")]
    public static int get_font_descent (Font font);

    /**
     * Get the direction to be used for text shaping by a font.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetFontDirection]]
     *
     * @param font the {@link Font} to query.
     *
     * @return the {@link Direction} to be used for text shaping.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetFontDirection")]
    public static Direction get_font_direction (Font font);

    /**
     * Get font target resolutions, in dots per inch.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetFontDPI]]
     *
     * @param font the {@link Font} to query.
     * @param hdpi an ``int`` filled in with the target horizontal DPI.
     * @param vdpi an ``int`` filled in with the target vertical DPI.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see set_font_size_dpi
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetFontDPI")]
    public static bool get_font_dpi (Font font, out int hdpi, out int vdpi);

    /**
     * Query a font's family name.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetFontFamilyName]]
     *
     * @param font the {@link Font} to query.
     *
     * @return the font's family name.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetFontFamilyName")]
    public static unowned string get_font_family_name (Font font);

    /**
     * Get the font generation.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetFontGeneration]]
     *
     * @param font the {@link Font} to query.
     *
     * @return he font generation or 0 on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetFontGeneration")]
    public static uint32 get_font_generation (Font font);

    /**
     * Query the total height of a font.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetFontHeight]]
     *
     * @param font the {@link Font} to query.
     *
     * @return the font's height.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetFontHeight")]
    public static int get_font_height (Font font);

    /**
     * Query a font's current FreeType hinter setting.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetFontHinting]]
     *
     * @param font the {@link Font} to query.
     *
     * @return font's current {@link HintingFlags} inter value, or
     * {@link HintingFlags.INVALID} if the font is invalid.
     *
     * @since 3.0.0
     *
     * @see set_font_hinting
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetFontHinting")]
    public static HintingFlags get_font_hinting (Font font);

    /**
     * Query whether or not kerning is enabled for a font.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetFontKerning]]
     *
     * @param font the {@link Font} to query.
     *
     * @return true if kerning is enabled, false otherwise.
     *
     * @since 3.0.0
     *
     * @see set_font_kerning
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetFontKerning")]
    public static bool get_font_kerning (Font font);

    /**
     * Query the spacing between lines of text for a font.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetFontLineSkip]]
     *
     * @param font the {@link Font} to query.
     *
     * @return the font's recommended spacing.
     *
     * @since 3.0.0
     *
     * @see set_font_line_skip
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetFontLineSkip")]
    public static int get_font_line_skip (Font font);

    /**
     * Query a font's current outline.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetFontOutline]]
     *
     * @param font the {@link Font} to query.
     *
     * @return the font's current outline value.
     *
     * @since 3.0.0
     *
     * @see set_font_outline
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetFontOutline")]
    public static int get_font_outline (Font font);

    /**
     * Get the properties associated with a font.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetFontProperties]]
     *
     * @param font the {@link Font} to query.
     *
     * @return a valid property ID on success or 0 on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetFontProperties")]
    public static SDL.Properties.PropertiesID get_font_properties (Font font);

    /**
     * Get the script used for text shaping a font.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetFontScript]]
     *
     * @param font the {@link Font} to query.
     *
     * @return an [[https://unicode.org/iso15924/iso15924-codes.html|ISO 15924]]
     * code or 0 if a script hasn't been set.
     *
     * @since 3.0.0
     *
     * @see set_font_script
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetFontScript")]
    public static uint32 get_font_script (Font font);

    /**
     * Query whether Signed Distance Field rendering is enabled for a font.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetFontSDF]]
     *
     * @param font the {@link Font} to query.
     *
     * @return true if enabled, false otherwise.
     *
     * @since 3.0.0
     *
     * @see set_font_sdf
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetFontSDF")]
    public static bool get_font_sdf (Font font);

    /**
     * Get the size of a font.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetFontSize]]
     *
     * @param font the {@link Font} to query.
     *
     * @return the size of the font, or 0.0f on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see set_font_size
     * @see set_font_size_dpi
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetFontSize")]
    public static float get_font_size (Font font);

    /**
     * Query a font's current style.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetFontStyle]]
     *
     * @param font the {@link Font} to query.
     *
     * @return the current font style, as a set of bit flags.
     *
     * @since 3.0.0
     *
     * @see set_font_style
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetFontStyle")]
    public static FontStyleFlags get_font_style (Font font);

    /**
     * Query a font's style name.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetFontStyleName]]
     *
     * @param font the {@link Font} to query.
     *
     * @return the font's style name.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetFontStyleName")]
    public static string get_font_style_name (Font font);

    /**
     * Query a font's weight, in terms of the lightness/heaviness of the strokes.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetFontWeight]]
     *
     * @param font the {@link Font} to query.
     *
     * @return the font's current weight.
     *
     * @since 3.2.2
     */
    [Version (since = "3.2.2")]
    [CCode (cname = "TTF_GetFontWeight")]
    public static int get_font_weight (Font font);

    /**
     * Query a font's current wrap alignment option.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetFontWrapAlignment]]
     *
     * @param font the {@link Font} to query.
     *
     * @return the font's current wrap alignment option.
     *
     * @since 3.0.0
     *
     * @see set_font_wrap_alignment
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetFontWrapAlignment")]
    public static HorizontalAlignment get_font_wrap_alignment (Font font);

    /**
     * Query the version of the FreeType library in use.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetFreeTypeVersion]]
     *
     * @param major to be filled in with the major version number.
     * @param minor to be filled in with the minor version number.
     * @param patch to be filled in with the patch version number.
     *
     * @since 3.0.0
     *
     * @see init
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetFreeTypeVersion")]
    public static void get_freetype_version (out int major, out int minor, out int patch);

    /**
     * Get the pixel image for a UNICODE codepoint.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetGlyphImage]]
     *
     * @param font the {@link Font} to query.
     * @param ch the codepoint to check.
     * @param image_type a pointer filled in with the glyph image type, may be null.
     *
     * @return an {@link SDL.Surface.Surface} containing the glyph, or null on failure;
     * call {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetGlyphImage")]
    public static SDL.Surface.Surface ? get_glyph_image (Font font,
                                                         uint32 ch,
                                                         ImageType ? image_type);

    /**
     * Get the pixel image for a character index.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetGlyphImage]]
     *
     * @param font the {@link Font} to query.
     * @param ch the codepoint to check.
     * @param image_type a pointer filled in with the glyph image type, may be null.
     *
     * @return an {@link SDL.Surface.Surface} containing the glyph, or null on failure;
     * call {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetGlyphImageForIndex")]
    public static SDL.Surface.Surface ? get_glyph_image_for_index (Font font,
            uint32 ch,
            ImageType ? image_type);

    /**
     * Query the kerning size between the glyphs of two UNICODE codepoints.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetGlyphKerning]]
     *
     * @param font the {@link Font} to query.
     * @param previous_ch the previous codepoint.
     * @param ch the current codepoint.
     * @param kerning a pointer filled in with the kerning size between the two glyphs,
     * in pixels, may be null.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetGlyphKerning")]
    public static bool get_glyph_kerning (Font font,
            uint32 previous_ch,
            uint32 ch,
            out int kerning);

    /**
     * Query the metrics (dimensions) of a font's glyph for a UNICODE codepoint.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetGlyphMetrics]]
     *
     * @param font the {@link Font} to query.
     * @param ch the codepoint to check.
     * @param minx filled in with the minimum x coordinate of the glyph
     * from the left edge of its bounding box. This value may be negative.
     * @param maxx filled in with the maximum x coordinate of the glyph
     * from the left edge of its bounding box.
     * @param miny filled in with the minimum y coordinate of the glyph
     * from the bottom edge of its bounding box. This value may be negative.
     * @param maxy filled in with the maximum y coordinate of the glyph
     * from the bottom edge of its bounding box.
     * @param advance filled in with the distance to the next glyph from
     * the left edge of this glyph's bounding box.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetGlyphMetrics")]
    public static bool get_glyph_metrics (Font font,
            uint32 ch,
            out int minx,
            out int maxx,
            out int miny,
            out int maxy,
            out int advance);

    /**
     * Get the script used by a 32-bit codepoint.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetGlyphScript]]
     *
     * @param ch the character code to check.
     *
     * @return an [[https://unicode.org/iso15924/iso15924-codes.html|ISO 15924 code]]
     * code on success, or 0 on failure; call {@link SDL.Error.get_error}
     * for more information.
     *
     * @since 3.0.0
     *
     * @see tag_to_string
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetGlyphScript")]
    public static uint32 get_glyph_script (uint32 ch);

    /**
     * Get the geometry data needed for drawing the text.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetGPUTextDrawData]]
     *
     * @param text the text to draw.
     *
     * @return a null terminated linked list of
     * {@link GPUAtlasDrawSequence} objects or null if the passed
     * text is empty or in case of failure; call {@link SDL.Error.get_error}
     * for more information.
     *
     * @since 3.0.0
     *
     * @see create_gpu_text_engine
     * @see create_text
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetGPUTextDrawData", array_length = false, array_null_terminated = true)]
    public static GPUAtlasDrawSequence ? get_gpu_text_draw_data (Text text);

    /**
     * Get the winding order of the vertices returned by
     * {@link get_gpu_text_draw_data} for a particular GPU text engine.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetGPUTextEngineWinding]]
     *
     * @param engine a {@link TextEngine} object created with {@link create_gpu_text_engine}.
     *
     * @return the winding order used by the GPU text engine or
     * {@link GPUTextEngineWinding.INVALID} in case of error.
     *
     * @since 3.0.0
     *
     * @see set_gpu_text_engine_winding
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetGPUTextEngineWinding")]
    public static GPUTextEngineWinding get_gpu_text_engine_winding (TextEngine engine);

    /**
     * Query the version of the HarfBuzz library in use.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetHarfBuzzVersion]]
     *
     * @param major to be filled in with the major version number.
     * @param minor to be filled in with the minor version number.
     * @param patch to be filled in with the patch version number.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetHarfBuzzVersion")]
    public static void get_harf_buzz_version (out int major, out int minor, out int patch);

    /**
     * Get the next substring in a text object
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetNextTextSubString]]
     *
     * @param text the {@link Text} to query.
     * @param substring the {@link SubString} to query.
     * @param next filled in with the next substring in the text object.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see get_previous_text_substring
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetNextTextSubString")]
    public static bool get_next_text_substring (Text text, SubString substring, out SubString next);

    /**
     * Query the number of faces of a font.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetNumFontFaces]]
     *
     * @param font the {@link Font} to query.
     *
     * @return the number of FreeType font faces.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetNumFontFaces")]
    public static int get_num_font_faces (Font font);

    /**
     * Get the previous substring in a text object
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetPreviousTextSubString]]
     *
     * @param text the {@link Text} to query.
     * @param substring the {@link SubString} to query.
     * @param previous filled in with the previous substring in the text object.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see get_next_text_substring
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetPreviousTextSubString")]
    public static bool get_previous_text_substring (Text text,
                                                    SubString substring,
                                                    out SubString previous);

    /**
     * Calculate the dimensions of a rendered string of UTF-8 text.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetStringSize]]
     *
     * @param font the {@link Font} to query.
     * @param text text to calculate, in UTF-8 encoding.
     * @param length the length of the text, in bytes, or 0 for null terminated text.
     * @param w will be filled with width, in pixels.
     * @param h will be filled with height, in pixels.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see get_string_size_wrapped
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetStringSize")]
    public static bool get_string_size (Font font,
                                        string text,
                                        size_t length,
                                        out int w,
                                        out int h);

    /**
     * Calculate the dimensions of a rendered string of UTF-8 text.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetStringSizeWrapped]]
     *
     * @param font the {@link Font} to query.
     * @param text text to calculate, in UTF-8 encoding.
     * @param length the length of the text, in bytes, or 0 for null terminated text.
     * @param wrap_width the maximum width or 0 to wrap on newline characters.
     * @param w will be filled with width, in pixels.
     * @param h will be filled with height, in pixels.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see get_string_size
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetStringSizeWrapped")]
    public static bool get_string_size_wrapped (Font font,
                                                string text,
                                                size_t length,
                                                int wrap_width,
                                                out int w,
                                                out int h);

    /**
     * Get the color of a text object.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetTextColor]]
     *
     * @param text the {@link Text} to query.
     * @param r filled in with the red color value in the range of 0-255.
     * @param g filled in with the green color value in the range of 0-255.
     * @param b filled in with the blue color value in the range of 0-255.
     * @param a filled in with the alpha color value in the range of 0-255.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see get_text_color_float
     * @see set_text_color
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetTextColor")]
    public static bool get_text_color (Text text,
                                       out uint8 r,
                                       out uint8 g,
                                       out uint8 b,
                                       out uint8 a);

    /**
     * Get the color of a text object.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetTextColorFloat]]
     *
     * @param text the {@link Text} to query.
     * @param r filled in with the red color value in the range of 0-1.
     * @param g filled in with the green color value in the range of 0-1.
     * @param b filled in with the blue color value in the range of 0-1.
     * @param a filled in with the alpha color value in the range of 0-1.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see get_text_color
     * @see set_text_color_float
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetTextColorFloat")]
    public static bool get_text_color_float (Text text,
                                             out float r,
                                             out float g,
                                             out float b,
                                             out float a);

    /**
     * Get the direction to be used for text shaping a text object.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetTextDirection]]
     *
     * @param text the {@link Text} to query.
     *
     * @return the direction to be used for text shaping.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetTextDirection")]
    public static Direction get_text_direction (Text text);

    /**
     * Get the text engine used by a text object.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetTextEngine]]
     *
     * @param text the {@link Text} to query.
     *
     * @return the {@link TextEngine} used by the text on success or null on failure;
     * call {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see set_text_engine
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetTextEngine")]
    public static TextEngine ? get_text_engine (Text text);

    /**
     * Get the font used by a text object.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetTextFont]]
     *
     * @param text the {@link Text} to query.
     *
     * @return the {@link Font} used by the text on success or null on failure;
     * call {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see set_text_font
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetTextFont")]
    public static Font ? get_text_font (Text text);

    /**
     * Get the position of a text object.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetTextPosition]]
     *
     * @param text the {@link Text} to query.
     * @param x filled in with the x offset of the upper left corner
     * of this text in pixels.
     * @param y filled in with the y offset of the upper left corner
     * of this text in pixels.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see set_text_position
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetTextPosition")]
    public static bool get_text_position (Text text, out int x, out int y);

    /**
     * Get the properties associated with a text object.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetTextProperties]]
     *
     * @param text the {@link Text} to query.
     *
     * @return a valid property ID on success or 0 on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [CCode (cname = "TTF_GetTextProperties")]
    public static SDL.Properties.PropertiesID get_text_properties (Text text);

    /**
     * Get the script used for text shaping a text object.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetTextScript]]
     *
     * @param text the {@link Text} to query.
     *
     * @return an [[https://unicode.org/iso15924/iso15924-codes.html|ISO 15924]]
     * code or 0 if a script hasn't been set on either the text object or the font.
     *
     * @since 3.0.0
     *
     * @see set_text_script
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetTextScript")]
    public static uint32 get_text_script (Text text);

    /**
     * Get the size of a text object.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetTextSize]]
     *
     * @param text the {@link Text} to query.
     * @param w will be filled with the width of the text, in pixels.
     * @param h will be filled with the height of the text, in pixels.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetTextSize")]
    public static bool get_text_size (Text text, out int w, out int h);

    /**
     * Get the substring of a text object that surrounds a text offset.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetTextSubString]]
     *
     * @param text the {@link Text} to query.
     * @param offset a byte offset into the text string.
     * @param substring filled in with the substring containing the offset
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetTextSubString")]
    public static bool get_text_substring (Text text, int offset, out SubString substring);

    /**
     * Get the substring of a text object that contains the given line.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetTextSubStringForLine]]
     *
     * @param text the {@link Text} to query.
     * @param line a zero-based line index, in the range [0 .. text->num_lines-1].
     * @param substring filled in with the substring containing the offset
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetTextSubStringForLine")]
    public static bool get_text_substring_for_line (Text text, int line, SubString substring);

    /**
     * Get the portion of a text string that is closest to a point.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetTextSubStringForPoint]]
     *
     * @param text the {@link Text} to query.
     * @param x the x coordinate relative to the left side of the text, may
     * be outside the bounds of the text area.
     * @param y the y coordinate relative to the left side of the text, may
     * be outside the bounds of the text area.
     * @param substring filled in with the substring containing the offset
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetTextSubStringForPoint")]
    public static bool get_text_substring_for_point (Text text, int x, int y, SubString substring);

    /**
     * Get the substrings of a text object that contain a range of text.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetTextSubStringsForRange]]
     *
     * @param text the {@link Text} to query.
     * @param offset a byte offset into the text string.
     * @param length the length of the range being queried, in bytes, or -1
     * for the remainder of the string.
     *
     * @return an array of substring pointers or null on failure;
     * call {@link SDL.Error.get_error} for more information. This
     * is a single allocation that should be freed when it is no longer needed.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetTextSubStringsForRange")]
    public static SubString[] ? get_text_substring_for_range (Text text, int offset, int length);

    /**
     * Get whether wrapping is enabled on a text object.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GetTextWrapWidth]]
     *
     * @param text the {@link Text} to query.
     * @param wrap_width filled in with the maximum width in pixels
     * or 0 if the text is being wrapped on newline characters.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see set_text_wrap_width
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GetTextWrapWidth")]
    public static bool get_text_wrap_width (Text text, out int wrap_width);

    /**
     * Initialize SDL_ttf.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_Init]]
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_Init")]
    public static bool init ();

    /**
     * Insert UTF-8 text into a text object.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_InsertTextString]]
     *
     * @param text the {@link Text} to modify.
     * @param offset the offset, in bytes, from the beginning of the
     * string if >= 0, the offset from the end of the string if < 0.
     * Note that this does not do UTF-8 validation, so you should
     * only insert at UTF-8 sequence boundaries.
     * @param text_to_insert the UTF-8 text to insert.
     * @param length the length of the text, in bytes, or 0 for null terminated text.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see append_text_string
     * @see delete_text_string
     * @see set_text_string
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_InsertTextString")]
    public static bool insert_text_string (Text text,
                                           int offset,
                                           string text_to_insert,
                                           size_t length);

    /**
     * Calculate how much of a UTF-8 string will fit in a given width.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_MeasureString]]
     *
     * @param font the {@link Font} to query.
     * @param text text to calculate, in UTF-8 encoding.
     * @param max_width maximum width, in pixels, available for the
     * string, or 0 for unbounded width.
     * @param measured_width filled in with the width, in pixels,
     * of the string that will fit, may be NULL.
     * @param measured_length filled in with the length, in bytes,
     * of the string that will fit, may be NULL.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_MeasureString")]
    public static bool measure_string (Font font,
                                       string text,
                                       int max_width,
                                       out int measured_width,
                                       out size_t measured_length);

    /**
     * Create a font from a file, using a specified point size.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_OpenFont]]
     *
     * @param file path to font file.
     * @param point_size point size to use for the newly-opened font.
     *
     * @return a valid {@link Font}, or null on failure;
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see close_font
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_OpenFont")]
    public static Font ? open_font (string file, float point_size);

    /**
     * Create a font from an {@link SDL.IOStream.IOStream},
     * using a specified point size.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_OpenFont]]
     *
     * @param src a {@link SDL.IOStream.IOStream} to provide
     * a font file's data.
     * @param close_io true to close src when the font is
     * closed, false to leave it open.
     * @param point_size point size to use for the newly-opened font.
     *
     * @return a valid {@link Font}, or null on failure;
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see close_font
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_OpenFontIO")]
    public static Font ? open_font_io (SDL.IOStream.IOStream src, bool close_io, float point_size);

    /**
     * Create a font with the specified properties.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_OpenFontWithProperties]]
     *
     * @param props the properties to use.
     *
     * @return a valid {@link Font}, or null on failure;
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see close_font
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_OpenFontWithProperties")]
    public static Font ? open_font_with_properties (SDL.Properties.PropertiesID props);

    /**
     * Deinitialize {@link SDL.TTF}.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_Quit]]
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_Quit")]
    public static void quit ();

    /**
     * Remove a fallback font.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_RemoveFallbackFont]]
     *
     * @param font the font to modify.
     * @param fallback the font to remove as a fallback.
     *
     * @since 3.0.0
     *
     * @see add_fallback_font
     * @see clear_fallback_fonts
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_RemoveFallbackFont")]
    public static void remove_fallback_font (Font font, Font fallback);

    /**
     * Render a single UNICODE codepoint at high quality to a new ARGB surface.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_RenderGlyph_Blended]]
     *
     * @param font the {@link Font} to render with.
     * @param ch the codepoint to render.
     * @param fg the foreground color for the text.
     *
     * @return a new 32-bit, ARGB surface, or null if there was an error.
     *
     * @since 3.0.0
     *
     * @see render_glyph_lcd
     * @see render_glyph_shaded
     * @see render_glyph_solid
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_RenderGlyph_Blended")]
    public static SDL.Surface.Surface ? render_glyph_blended (Font font,
                                                              uint32 ch,
                                                              SDL.Pixels.Color fg);

    /**
     * Render a single UNICODE codepoint at LCD subpixel quality to a new ARGB surface.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_RenderGlyph_LCD]]
     *
     * @param font the {@link Font} to render with.
     * @param ch the codepoint to render.
     * @param fg the foreground color for the text.
     * @param bg the backgroundcolor for the text.
     *
     * @return a new 32-bit, ARGB surface, or null if there was an error.
     *
     * @since 3.0.0
     *
     * @see render_glyph_blended
     * @see render_glyph_shaded
     * @see render_glyph_solid
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_RenderGlyph_LCD")]
    public static SDL.Surface.Surface ? render_glyph_lcd (Font font,
                                                          uint32 ch,
                                                          SDL.Pixels.Color fg,
                                                          SDL.Pixels.Color bg);

    /**
     * Render a single UNICODE codepoint at high quality to a new 8-bit surface.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_RenderGlyph_Shaded]]
     *
     * @param font the {@link Font} to render with.
     * @param ch the codepoint to render.
     * @param fg the foreground color for the text.
     * @param bg the backgroundcolor for the text.
     *
     * @return a new 8-bit, palettized surface, or null if there was an error.
     *
     * @since 3.0.0
     *
     * @see render_glyph_blended
     * @see render_glyph_lcd
     * @see render_glyph_solid
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_RenderGlyph_Shaded")]
    public static SDL.Surface.Surface ? render_glyph_shaded (Font font, uint32 ch,
                                                             SDL.Pixels.Color fg,
                                                             SDL.Pixels.Color bg);

    /**
     * Render a single 32-bit glyph at fast quality to a new 8-bit surface.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_RenderGlyph_Solid]]
     *
     * @param font the {@link Font} to render with.
     * @param ch the codepoint to render.
     * @param fg the foreground color for the text.
     *
     * @return a new 8-bit, palettized surface, or null if there was an error.
     *
     * @since 3.0.0
     *
     * @see render_glyph_blended
     * @see render_glyph_lcd
     * @see render_glyph_shaded
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_RenderGlyph_Solid")]
    public static SDL.Surface.Surface ? render_glyph_solid (Font font,
                                                            uint32 ch,
                                                            SDL.Pixels.Color fg);

    /**
     * Render UTF-8 text at high quality to a new ARGB surface.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_RenderText_Blended]]
     *
     * @param font the {@link Font} to render with.
     * @param text text to render, in UTF-8 encoding.
     * @param length the length of the text, in bytes, or 0 for null terminated text.
     * @param fg the foreground color for the text.
     *
     * @return a new 8-bit, palettized surface, or null if there was an error.
     *
     * @since 3.0.0
     *
     * @see render_glyph_blended
     * @see render_glyph_lcd
     * @see render_glyph_shaded
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_RenderText_Blended")]
    public static SDL.Surface.Surface ? render_text_blended (Font font,
                                                             string text,
                                                             size_t length,
                                                             SDL.Pixels.Color fg);

    /**
     * Render word-wrapped UTF-8 text at high quality to a new ARGB surface.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_RenderText_Blended_Wrapped]]
     *
     * @param font the {@link Font} to render with.
     * @param text text to render, in UTF-8 encoding.
     * @param length the length of the text, in bytes, or 0 for null terminated text.
     * @param fg the foreground color for the text.
     * @param wrap_width the maximum width of the text surface or 0 to wrap on newline characters.
     *
     * @return a new 32-bit, ARGB surface, or null if there was an error.
     *
     * @since 3.0.0
     *
     * @see render_text_blended
     * @see render_text_lcd_wrapped
     * @see render_text_shaded_wrapped
     * @see render_text_solid_wrapped
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_RenderText_Blended_Wrapped")]
    public static SDL.Surface.Surface ? render_text_blended_wrapped (Font font,
                                                                     string text,
                                                                     size_t length,
                                                                     SDL.Pixels.Color fg,
                                                                     int wrap_width);

    /**
     * Render UTF-8 text at LCD subpixel quality to a new ARGB surface.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_RenderText_LCD]]
     *
     * @param font the {@link Font} to render with.
     * @param text text to render, in UTF-8 encoding.
     * @param length the length of the text, in bytes, or 0 for null terminated text.
     * @param fg the foreground color for the text.
     * @param bg the background color for the text.
     *
     * @return a new 8-bit, palettized surface, or null if there was an error.
     *
     * @since 3.0.0
     *
     * @see render_text_blended
     * @see render_text_lcd_wrapped
     * @see render_text_shaded
     * @see render_text_solid
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_RenderText_LCD")]
    public static SDL.Surface.Surface ? render_text_lcd (Font font,
                                                         string text,
                                                         size_t length,
                                                         SDL.Pixels.Color fg,
                                                         SDL.Pixels.Color bg);

    /**
     * Render word-wrapped UTF-8 text at LCD subpixel quality to a new ARGB surface.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_RenderText_LCD_Wrapped]]
     *
     * @param font the {@link Font} to render with.
     * @param text text to render, in UTF-8 encoding.
     * @param length the length of the text, in bytes, or 0 for null terminated text.
     * @param fg the foreground color for the text.
     * @param bg the background color for the text.
     * @param wrap_width the maximum width of the text surface or 0 to wrap on newline characters.
     *
     * @return a new 32-bit, ARGB surface, or null if there was an error.
     *
     * @since 3.0.0
     *
     * @see render_text_blended_wrapped
     * @see render_text_lcd
     * @see render_text_shaded_wrapped
     * @see render_text_solid_wrapped
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_RenderText_LCD_Wrapped")]
    public static SDL.Surface.Surface ? render_text_lcd_wrapped (Font font,
                                                                 string text,
                                                                 size_t length,
                                                                 SDL.Pixels.Color fg,
                                                                 SDL.Pixels.Color bg,
                                                                 int wrap_width);

    /**
     * Render UTF-8 text at high quality to a new 8-bit surface.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_RenderText_Shaded]]
     *
     * @param font the {@link Font} to render with.
     * @param text text to render, in UTF-8 encoding.
     * @param length the length of the text, in bytes, or 0 for null terminated text.
     * @param fg the foreground color for the text.
     * @param bg the background color for the text.
     *
     * @return a new 8-bit, palettized surface, or null if there was an error.
     *
     * @since 3.0.0
     *
     * @see render_text_blended
     * @see render_text_lcd_wrapped
     * @see render_text_shaded
     * @see render_text_solid
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_RenderText_Shaded")]
    public static SDL.Surface.Surface ? render_text_shaded (Font font,
                                                            string text,
                                                            size_t length,
                                                            SDL.Pixels.Color fg,
                                                            SDL.Pixels.Color bg);

    /**
     * Render word-wrapped UTF-8 text at high quality to a new 8-bit surface.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_RenderText_Shaded_Wrapped]]
     *
     * @param font the {@link Font} to render with.
     * @param text text to render, in UTF-8 encoding.
     * @param length the length of the text, in bytes, or 0 for null terminated text.
     * @param fg the foreground color for the text.
     * @param bg the background color for the text.
     * @param wrap_width the maximum width of the text surface or 0 to wrap on newline characters.
     *
     * @return a new 8-bit, palettized surface, or null if there was an error.
     *
     * @since 3.0.0
     *
     * @see render_text_blended_wrapped
     * @see render_text_lcd_wrapped
     * @see render_text_shaded
     * @see render_text_solid_wrapped
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_RenderText_Shaded_Wrapped")]
    public static SDL.Surface.Surface ? render_text_shaded_wrapped (Font font,
                                                                    string text,
                                                                    size_t length,
                                                                    SDL.Pixels.Color fg,
                                                                    SDL.Pixels.Color bg,
                                                                    int wrap_width);

    /**
     * Render UTF-8 text at fast quality to a new 8-bit surface.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_RenderText_Solid]]
     *
     * @param font the {@link Font} to render with.
     * @param text text to render, in UTF-8 encoding.
     * @param length the length of the text, in bytes, or 0 for null terminated text.
     * @param fg the foreground color for the text.
     *
     * @return a new 8-bit, palettized surface, or null if there was an error.
     *
     * @since 3.0.0
     *
     * @see render_text_blended
     * @see render_text_lcd
     * @see render_text_shaded
     * @see render_text_solid_wrapped
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_RenderText_Solid")]
    public static SDL.Surface.Surface ? render_text_solid (Font font,
                                                           string text,
                                                           size_t length,
                                                           SDL.Pixels.Color fg);

    /**
     * Render word-wrapped UTF-8 text at fast quality to a new 8-bit surface.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_RenderText_Solid_Wrapped]]
     *
     * @param font the {@link Font} to render with.
     * @param text text to render, in UTF-8 encoding.
     * @param length the length of the text, in bytes, or 0 for null terminated text.
     * @param fg the foreground color for the text.
     * @param wrap_width the maximum width of the text surface or 0 to wrap on newline characters.
     *
     * @return a new 8-bit, palettized surface, or null if there was an error.
     *
     * @since 3.0.0
     *
     * @see render_text_blended_wrapped
     * @see render_text_lcd_wrapped
     * @see render_text_shaded_wrapped
     * @see render_text_solid
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_RenderText_Solid_Wrapped")]
    public static SDL.Surface.Surface ? render_text_solid_wrapped (Font font,
                                                                   string text,
                                                                   size_t length,
                                                                   SDL.Pixels.Color fg,
                                                                   int wrap_width);

    /**
     * Set the direction to be used for text shaping by a font.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_SetFontDirection]]
     *
     * @param font the {@link Font} to modify.
     * @param direction the new direction for text to flow.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see get_font_direction
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_SetFontDirection")]
    public static bool set_font_direction (Font font, Direction direction);

    /**
     * Set a font's current hinter setting.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_SetFontHinting]]
     *
     * @param font the {@link Font} to modify.
     * @param hinting the new hinter setting.
     *
     * @since 3.0.0
     *
     * @see get_font_hinting
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_SetFontHinting")]
    public static void set_font_hinting (Font font, HintingFlags hinting);

    /**
     * Set if kerning is enabled for a font.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_SetFontKerning]]
     *
     * @param font the {@link Font} to modify.
     * @param enabled true to enable kerning, false to disable.
     *
     * @since 3.0.0
     *
     * @see get_font_kerning
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_SetFontKerning")]
    public static void set_font_kerning (Font font, bool enabled);

    /**
     * Set language to be used for text shaping by a font.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_SetFontLanguage]]
     *
     * @param font the {@link Font} to modify.
     * @param language_bcp47 a string containing the desired language's
     * BCP47 code. Or null to reset the value.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_SetFontLanguage")]
    public static bool set_font_language (Font font, string? language_bcp47);

    /**
     * Set the spacing between lines of text for a font.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_SetFontLineSkip]]
     *
     * @param font the {@link Font} to modify.
     * @param line_skip the new line spacing for the font.
     *
     * @since 3.0.0
     *
     * @see get_font_line_skip
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_SetFontLineSkip")]
    public static void set_font_line_skip (Font font, int line_skip);

    /**
     * Set a font's current outline.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_SetFontOutline]]
     *
     * @param font the {@link Font} to modify.
     * @param outline positive outline value, 0 to default.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see get_font_outline
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_SetFontOutline")]
    public static bool set_font_outline (Font font, int outline);

    /**
     * Set the script to be used for text shaping by a font.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_SetFontScript]]
     *
     * @param font the {@link Font} to modify.
     * @param script an [[https://unicode.org/iso15924/iso15924-codes.html|ISO 15924]] code.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see get_font_script
     * @see string_to_tag
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_SetFontScript")]
    public static bool set_font_script (Font font, uint32 script);

    /**
     * Enable Signed Distance Field rendering for a font.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_SetFontSDF]]
     *
     * @param font the {@link Font} to modify.
     * @param enabled true to enable SDF, false to disable.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see get_font_sdf
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_SetFontSDF")]
    public static bool set_font_sdf (Font font, bool enabled);

    /**
     * Set a font's size dynamically.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_SetFontSize]]
     *
     * @param font the {@link Font} to modify.
     * @param point_size the new point size.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see get_font_size
     * @see set_font_size_dpi
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_SetFontSize")]
    public static bool set_font_size (Font font, float point_size);

    /**
     * Set font size dynamically with target resolutions, in dots per inch.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_SetFontSizeDPI]]
     *
     * @param font the {@link Font} to modify.
     * @param point_size the new point size.
     * @param hdpi the target horizontal DPI.
     * @param vdpi the target vertical DPI.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see get_font_size
     * @see set_font_size
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_SetFontSizeDPI")]
    public static bool set_font_size_dpi (Font font, float point_size, int hdpi, int vdpi);

    /**
     * Set a font's current wrap alignment option.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_SetFontStyle]]
     *
     * @param font the {@link Font} to modify.
     * @param style the new style values to set, OR'd together.
     *
     * @since 3.0.0
     *
     * @see get_font_style
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_SetFontStyle")]
    public static void set_font_style (Font font, FontStyleFlags style);

    /**
     * Set a font's current wrap alignment option.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_SetFontWrapAlignment]]
     *
     * @param font the {@link Font} to modify.
     * @param align the new wrap alignment option.
     *
     * @since 3.0.0
     *
     * @see get_font_wrap_alignment
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_SetFontWrapAlignment")]
    public static void set_font_wrap_alignment (Font font, HorizontalAlignment align);

    /**
     * Sets the winding order of the vertices returned by
     * {@link get_gpu_text_draw_data} for a particular GPU text engine.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_SetGPUTextEngineWinding]]
     *
     * @param engine a {@link TextEngine} object created with {@link create_gpu_text_engine}.
     * @param winding the new winding order option.
     *
     * @since 3.0.0
     *
     * @see get_gpu_text_engine_winding
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_SetGPUTextEngineWinding")]
    public static void set_gpu_text_engine_winding (TextEngine engine, GPUTextEngineWinding winding);

    /**
     * Set the color of a text object.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_SetTextColor]]
     *
     * @param text the {@link Text} to modify.
     * @param r the red color value in the range of 0-255.
     * @param g the green color value in the range of 0-355.
     * @param b the blue color value in the range of 0-255.
     * @param a the alpha value in the range of 0-255.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see get_text_color
     * @see set_text_color_float
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_SetTextColor")]
    public static bool set_text_color (Text text, uint8 r, uint8 g, uint8 b, uint8 a);

    /**
     * Set the color of a text object.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_SetTextColorFloat]]
     *
     * @param text the {@link Text} to modify.
     * @param r the red color value in the range of 0-1.
     * @param g the green color value in the range of 0-1.
     * @param b the blue color value in the range of 0-1.
     * @param a the alpha value in the range of 0-1.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see get_text_color_float
     * @see set_text_color
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_SetTextColorFloat")]
    public static bool set_text_color_float (Text text, float r, float g, float b, float a);

    /**
     * Set the direction to be used for text shaping a text object.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_SetTextDirection]]
     *
     * @param text the {@link Text} to modify.
     * @param direction the new direction for text to flow.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see get_text_direction
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_SetTextDirection")]
    public static bool set_text_direction (Text text, Direction direction);

    /**
     * Set the text engine used by a text object.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_SetTextEngine]]
     *
     * @param text the {@link Text} to modify.
     * @param engine the text engine to use for drawing.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see get_text_engine
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_SetTextEngine")]
    public static bool set_text_engine (Text text, TextEngine engine);

    /**
     * Set the font used by a text object.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_SetTextFont]]
     *
     * @param text the {@link Text} to modify.
     * @param font the font to use, may be null.
     *
     * @return false if the text pointer is null; otherwise, true.
     * call {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see get_text_font
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_SetTextFont")]
    public static bool set_text_font (Text text, Font ? font);

    /**
     * Set the position of a text object.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_SetTextPosition]]
     *
     * @param text the {@link Text} to modify.
     * @param x the x offset of the upper left corner of this text in pixels.
     * @param y the y offset of the upper left corner of this text in pixels.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see get_text_position
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_SetTextPosition")]
    public static bool set_text_position (Text text, int x, int y);

    /**
     * Set the script to be used for text shaping a text object.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_SetTextScript]]
     *
     * @param text the {@link Text} to modify.
     * @param script an [[https://unicode.org/iso15924/iso15924-codes.html|ISO 15924]] code.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see string_to_tag
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_SetTextScript")]
    public static bool set_text_script (Text text, uint32 script);

    /**
     * Set the UTF-8 text used by a text object.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_SetTextString]]
     *
     * @param text the {@link Text} to modify.
     * @param text_to_set string the UTF-8 text to use, may be null.
     * @param length the length of the text, in bytes, or 0 for null terminated text.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see append_text_string
     * @see delete_text_string
     * @see insert_text_string
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_SetTextString")]
    public static bool set_text_string (Text text, string ? text_to_set, size_t length);

    /**
     * Set whether whitespace should be visible when wrapping a text object.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_SetTextWrapWhitespaceVisible]]
     *
     * @param text the {@link Text} to modify.
     * @param visible true to show whitespace when wrapping text, false to hide it.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     *
     * @see text_wrap_whitespace_visible
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_SetTextWrapWhitespaceVisible")]
    public static bool set_text_wrap_whitespace_visible (Text text, bool visible);

    /**
     * Set whether wrapping is enabled on a text object.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_SetTextWrapWidth]]
     *
     * @param text the {@link Text} to modify.
     * @param wrap_width the maximum width in pixels, 0 to wrap on newline characters.
     *
     * @return the 32-bit representation of the string.
     *
     * @since 3.0.0
     *
     * @see get_text_wrap_width
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_SetTextWrapWidth")]
    public static bool set_text_wrap_width (Text text, int wrap_width);

    /**
     * Convert from a 4 character string to a 32-bit tag.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_StringToTag]]
     *
     * @param text the 4 character string to convert.
     *
     * @return the 32-bit representation of the string.
     *
     * @since 3.0.0
     *
     * @see tag_to_string
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_StringToTag")]
    public static uint32 string_to_tag (string text);

    /**
     * Convert from a 32-bit tag to a 4 character string.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_TagToString]]
     *
     * @param tag the 32-bit tag to convert.
     * @param text filled in with the 4 character representation of the tag.
     *
     * @since 3.0.0
     *
     * @see string_to_tag
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_TagToString")]
    public static void tag_to_string (uint32 tag, out string? text);

    /**
     * Return whether whitespace is shown when wrapping a text object.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_TextWrapWhitespaceVisible]]
     *
     * @param text teh {@link Text} to query.
     *
     * @return true if whitespace is shown when wrapping text, or false otherwise.
     *
     * @since 3.0.0
     *
     * @see set_text_wrap_whitespace_visible
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_TextWrapWhitespaceVisible")]
    public static bool text_wrap_whitespace_visible (Text text);

    /**
     * This function gets the version of the dynamically linked SDL TTF library.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_UpdateText]]
     *
     * @param text teh {@link Text} to update.
     *
     * @return true on success or false on failure; call
     * {@link SDL.Error.get_error} for more information.
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_UpdateText")]
    public static bool update_text (Text text);

    /**
     * This function gets the version of the dynamically linked SDL TTF library.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_Version]]
     *
     * @return the SDL TTF version
     *
     * @since 3.0.0
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_Version")]
    public static int version ();

    /**
     * Check if SDL_ttf is initialized.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_WasInit]]
     *
     * @return the current number of initialization calls, that need to
     * eventually be paired with this many calls to ñ@link quit}.
     *
     * @since 3.0.0
     *
     * @see init
     * @see quit
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_WasInit")]
    public static int was_init ();

    /**
     * The internal structure containing font information.
     * Opaque data.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_Font]]
     *
     * @since 3.0.0
     *
     */
    [Version (since = "3.0.0")]
    [Compact, CCode (cname = "TTF_Font", free_function = "", has_type_id = false)]
    public class Font {}

    /**
     * Font style flags for {@link Font}.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_FontStyleFlags]]
     *
     * @since 3.0.0
     *
     * @see set_font_style
     * @see get_font_style
     */
    [Version (since = "3.0.0")]
    [Flags, CCode (cname = "Uint32", cprefix = "TTF_STYLE_", has_type_id = false)]
    public enum FontStyleFlags {
        /**
         * No special style
         *
         */
        NORMAL,

        /**
         * Bold style
         *
         */
        BOLD,

        /**
         * Italic style
         *
         */
        ITALIC,

        /**
         * Underline style
         *
         */
        UNDERLINE,

        /**
         * Strikethrough style
         *
         */
        STRIKETHROUGH,
    } // FontStyleFlags

    /**
     * Flags for {@link SubString}
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_SubStringFlags]]
     *
     * @since 3.0.0
     *
     * @see SubString
     */
    [Version (since = "3.0.0")]
    [Flags, CCode (cname = "Uint32", cprefix = "TTF_SUBSTRING_", has_type_id = false)]
    public enum SubStringFlags {
        /**
         * The mask for the flow direction for this substring
         *
         */
        DIRECTION_MASK,

        /**
         * This substring contains the beginning of the text
         *
         */
        TEXT_START,

        /**
         * This substring contains the beginning of line 'line_index'
         *
         */
        LINE_START,

        /**
         * This substring contains the end of line 'line_index'
         *
         */
        LINE_END,

        /**
         * This substring contains the end of the text
         *
         */
        TEXT_END,
    } // SubStringFlags

    /**
     * Internal data for {@link Text}. Opaque.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_TextData]]
     *
     * @since 3.0.0
     *
     */
    [Version (since = "3.0.0")]
    [Compact, CCode (cname = "TTF_TextData", free_function = "", has_type_id = false)]
    public class TextData {}

    /**
     * A text engine used to create text objects.
     *
     *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_TextEngine]]
     *
     * @since 3.0.0
     *
     * @see create_surface_text_engine
     * @see create_renderer_text_engine
     * @see create_gpu_text_engine
     */
    [Version (since = "3.0.0")]
    [Compact, CCode (cname = "TTF_TextEngine", free_function = "", has_type_id = false)]
    public class TextEngine {}

    /**
     * Draw sequence returned by {@link get_gpu_text_draw_data}
     *
     * @since 3.0.0
     *
     * @see get_gpu_text_draw_data
     */
    [Version (since = "3.0.0")]
    [Compact, CCode (cname = "TTF_GPUAtlasDrawSequence", free_function = "",
    has_copy_function = false, has_type_id = false)]
    public class GPUAtlasDrawSequence {
        /**
         * Texture atlas that stores the glyphs
         *
         */
        public SDL.GPU.GPUTexture atlas_texture;

        /**
         * An array of vertex positions
         *
         */
        [CCode (array_length_cname = "num_vertices", array_length_type = "int")]
        public SDL.Rect.FPoint[] xy;

        /**
         * An array of normalized texture coordinates for each vertex
         *
         */
        [CCode (array_length_cname = "num_vertices", array_length_type = "int")]
        public SDL.Rect.FPoint[] uv;

        /**
         * An array of indices into the 'vertices' arrays
         *
         */
        [CCode (array_length_cname = "num_indices", array_length_type = "int")]
        public int[] indices;

        /**
         * The image type of this draw sequence
         *
         */
        public ImageType image_type;

        /**
         * The next sequence (will be NULL in case of the last sequence)
         *
         */
        public GPUAtlasDrawSequence? next;
    } // GPUAtlasDrawSequence

    /**
     * The representation of a substring within text.
     *
     * @since 3.0.0
     *
     * @see create_text
     * @see get_text_properties
     * @see destroy_text
     */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_SubString", destroy_function = "", has_copy_function = false,
            has_type_id = false)]
    public struct SubString {
        /**
         * The flags for this substring
         *
         */
        public SubStringFlags flags;

        /**
         * The byte offset from the beginning of the text
         *
         */
        public int offset;

        /**
         * The byte length starting at the offset
         *
         */
        public int length;

        /**
         * The index of the line that contains this substring
         *
         */
        public int line_index;

        /**
         * The internal cluster index, used for quickly iterating
         *
         */
        public int cluster_index;

        /**
         * The rectangle, relative to the top left of the text, containing the substring
         *
         */
        public SDL.Rect.Rect rect;
    } // SubString

    /**
     * Text created with {@link create_text}
     *
     * @since 3.0.0
     *
     * @see create_text
     * @see get_text_properties
     * @see destroy_text
     */
    [Version (since = "3.0.0")]
    [Compact, CCode (cname = "TTF_Text", destroy_function = "",
    ref_function = "", unref_function = "", has_type_id = false)]
    public class Text {
        /**
         * A copy of the UTF-8 string that this text object represents,
         * useful for layout, debugging and retrieving substring text.
         * This is updated when the text object is modified and will be
         * freed automatically when the object is destroyed.
         *
         */
        public string text;

        /**
         * The number of lines in the text, 0 if it's empty
         *
         */
        public int num_lines;

        /**
         * Application reference count, used when freeing surface
         *
         */
        public int refcount;

        /**
         * Private data
         *
         */
        [CCode (cname = "internal")]
        public TextData internal_data;
    } // Text

    /**
    * Direction flags.
    *
    *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_Direction]]
    *
    * @since 3.0.0
    *
    * @see set_font_direction
    */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_Direction", cprefix = "TTF_DIRECTION_", has_type_id = false)]
    public enum Direction {
        /**
        * Invalid. This is default when not set
        */
        INVALID,

        /**
        * Left to Right
        */
        LTR,

        /**
        * Right to Left
        */
        RTL,

        /**
        * Top to Bottom
        */
        TTB,

        /**
        * Bottom to Top
        */
        BTT,
    } // Direction

    /**
    * The winding order of the vertices returned by {@link get_gpu_text_draw_data}
    *
    *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_GPUTextEngineWinding]]
    *
    * @since 3.0.0
    *
    * @see get_gpu_text_draw_data
    */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_GPUTextEngineWinding", cprefix = "TTF_GPU_TEXTENGINE_WINDING_", has_type_id = false)]
    public enum GPUTextEngineWinding {
        /**
        * Invalid. Defalt value when not set.
        *
        */
        INVALID,

        /**
        * Clockwise winding.
        *
        */
        CLOCKWISE,

        /**
        * Counter clockwise winding.
        *
        */
        COUNTER_CLOCKWISE,
    } // GPUTextEngineWinding

    /**
    * Hinting flags for TTF (TrueType Fonts)
    *
    *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_HintingFlags]]
    *
    * @since 3.0.0
    *
    * @see set_font_hinting
    * @see get_font_hinting
    */
    [Version (since = "3.0.0")]
    [Flags, CCode (cname = "TTF_HintingFlags", cprefix = "TTF_HINTING_", has_type_id = false)]
    public enum HintingFlags {
        /**
        * Invalid. Default when not set.
        *
        */
        INVALID,

        /**
        * Normal hinting applies standard grid-fitting.
        *
        */
        NORMAL,

        /**
        * Light hinting applies subtle adjustments to improve rendering.
        *
        */
        LIGHT,

        /**
        * Monochrome hinting adjusts the font for better rendering at lower
        * resolutions.
        *
        */
        MONO,

        /**
        * No hinting, the font is rendered without any grid-fitting.
        *
        */
        NONE,

        /**
        * Light hinting with subpixel rendering for more precise font edges.
        *
        */
        LIGHT_SUBPIXEL,
    } // HintingFlags

    /**
    * The horizontal alignment used when rendering wrapped text.
    *
    *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_HorizontalAlignment]]
    *
    * @since 3.0.0
    *
    * @see set_font_wrap_alignment
    * @see get_font_wrap_alignment
    */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_HorizontalAlignment", cprefix = "TTF_HORIZONTAL_ALIGN_", has_type_id = false)]
    public enum HorizontalAlignment {
        /**
        * Invalid. Default when not set.
        *
        */
        INVALID,

        /**
        * Left aligned
        *
        */
        LEFT,

        /**
        * Center aligned
        *
        */
        CENTER,

        /**
        * Right aligned
        *
        */
        RIGHT,
    } // HorizontalAlignment

    /**
    * The type of data in a glyph image
    *
    *   * [[https://wiki.libsdl.org/SDL3_ttf/TTF_ImageType]]
    *
    * @since 3.0.0
    *
    * @see get_glyph_image
    * @see get_glyph_image_for_index
    * @see GPUAtlasDrawSequence
    */
    [Version (since = "3.0.0")]
    [CCode (cname = "TTF_ImageType", cprefix = "TTF_IMAGE_", has_type_id = false)]
    public enum ImageType {
        /**
        * Invalid. Default when not set.
        *
        */
        INVALID,

        /**
        * The color channels are white
        *
        */
        ALPHA,

        /**
        * The color channels have image data
        *
        */
        COLOR,

        /**
        * The alpha channel has signed distance field information
        *
        */
        SDF,
    } // ImageType

    [CCode (cname = "UNICODE_BOM_NATIVE")]
    public const int32 UNICODE_BOM_NATIVE;

    /**
     * A namespace for constants of known font weights
     *
     * @see get_font_weight
     */
    namespace FontWeight {
        /**
         * Thin (100) named font weight value
         *
         * @since 3.2.2
         */
        [Version (since = "3.2.2")]
        [CCode (cname = "TTF_FONT_WEIGHT_THIN")]
        public const int THIN;

        /**
         * ExtraLight (200) named font weight value
         *
         * @since 3.2.2
         */
        [Version (since = "3.2.2")]
        [CCode (cname = "TTF_FONT_WEIGHT_EXTRA_LIGHT")]
        public const int EXTRA_LIGHT;

        /**
         * Light (300) named font weight value
         *
         * @since 3.2.2
         */
        [Version (since = "3.2.2")]
        [CCode (cname = "TTF_FONT_WEIGHT_LIGHT")]
        public const int LIGHT;

        /**
         * Normal (400) named font weight value
         *
         * @since 3.2.2
         */
        [Version (since = "3.2.2")]
        [CCode (cname = "TTF_FONT_WEIGHT_NORMAL")]
        public const int NORMAL;

        /**
         * Medium (500) named font weight value
         *
         * @since 3.2.2
         */
        [Version (since = "3.2.2")]
        [CCode (cname = "TTF_FONT_WEIGHT_MEDIUM")]
        public const int MEDIUM;

        /**
         * SemiBold (600) named font weight value
         *
         * @since 3.2.2
         */
        [Version (since = "3.2.2")]
        [CCode (cname = "TTF_FONT_WEIGHT_SEMI_BOLD")]
        public const int SEMI_BOLD;

        /**
         * Bold (700) named font weight value
         *
         * @since 3.2.2
         */
        [Version (since = "3.2.2")]
        [CCode (cname = "TTF_FONT_WEIGHT_BOLD")]
        public const int BOLD;

        /**
         * ExtraBold (800) named font weight value
         *
         * @since 3.2.2
         */
        [Version (since = "3.2.2")]
        [CCode (cname = "TTF_FONT_WEIGHT_EXTRA_BOLD")]
        public const int EXTRA_BOLD;

        /**
         * Black (900) named font weight value
         *
         * @since 3.2.2
         */
        [Version (since = "3.2.2")]
        [CCode (cname = "TTF_FONT_WEIGHT_BLACK")]
        public const int BLACK;

        /*
         * ExtraBlack (950) named font weight value
         *
         * @since 3.2.2
         */
        [Version (since = "3.2.2")]
        [CCode (cname = "TTF_FONT_WEIGHT_EXTRA_BLACK")]
        public const int EXTRA_BLACK;
    }

    /**
     * GPU text engine properties for {@link create_gpu_text_engine_with_properties}
     *
     */
    namespace PropGPUTextEngine {
        /**
         * The {@link SDL.GPU.GPUDevice} to use for creating textures and drawing text.
         *
         * @since 3.0.0
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "TTF_PROP_GPU_TEXT_ENGINE_DEVICE")]
        public const string DEVICE;

        /**
         * The the size of the texture atlas.
         *
         * @since 3.0.0
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "TTF_PROP_GPU_TEXT_ENGINE_ATLAS_TEXTURE_SIZE")]
        public const string ATLAS_TEXTURE_SIZE;
    } // PropGPUTextEngine

    /**
     * Renderer text engine properties for {@link create_renderer_text_engine_with_properties}
     *
     */
    namespace PropRendererTextEngine {
        /**
         * The {@link SDL.Render.Renderer} to use for creating textures and drawing text.
         *
         * @since 3.0.0
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "TTF_PROP_RENDERER_TEXT_ENGINE_RENDERER")]
        public const string RENDERER;

        /**
         * The the size of the texture atlas.
         *
         * @since 3.0.0
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "TTF_PROP_RENDERER_TEXT_ENGINE_ATLAS_TEXTURE_SIZE")]
        public const string ATLAS_TEXTURE_SIZE;
    } // PropRendererTextEngine

    /**
     * {@link Font} properties for {@link get_font_properties}
     * and {@link set_font_outline}
     *
     */
    namespace PropFont {
        /**
         * The //FreeType// ``FT_Stroker_LineCap`` value used when setting the font outline,
         * defaults to ``FT_STROKER_LINECAP_ROUND``.
         *
         * @since 3.0.0
         *
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "TTF_PROP_FONT_OUTLINE_LINE_CAP_NUMBER")]
        public const string OUTLINE_LINE_CAP_NUMBER;

        /**
         * The //FreeType// ``FT_Stroker_LineJoin`` value used when setting the font outline,
         * defaults to ``FT_STROKER_LINEJOIN_ROUND``.
         *
         * @since 3.0.0
         *
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "TTF_PROP_FONT_OUTLINE_LINE_JOIN_NUMBER")]
        public const string OUTLINE_LINE_JOIN_NUMBER;

        /**
         * The //FreeType// ``FT_Fixed`` value used when setting the font outline,
         * defaults to 0.
         *
         * @since 3.0.0
         *
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "TTF_PROP_FONT_OUTLINE_MITER_LIMIT_NUMBER")]
        public const string OUTLINE_MITER_LIMIT_NUMBER;
    } // PropFont

    /**
     * {@link Font} properties for {@link open_font_with_properties}
     *
     */
    namespace PropFontCreate {
        /**
         * The font file to open, if an {@link SDL.IOStream.IOStream} isn't being used.
         *
         * This is required if {@link PropFontCreate.IOSTREAM_POINTER} and
         * {@link PropFontCreate.EXISTING_FONT} aren't set.
         *
         * @since 3.0.0
         *
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "TTF_PROP_FONT_CREATE_FILENAME_STRING")]
        public const string FILENAME_STRING;

        /**
         * An {@link SDL.IOStream.IOStream} containing the font to be opened. This
         * should not be closed until the font is closed.
         *
         * This is required if {@link PropFontCreate.FILENAME_STRING} and
         * {@link PropFontCreate.EXISTING_FONT} aren't set.
         *
         * @since 3.0.0
         *
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "TTF_PROP_FONT_CREATE_IOSTREAM_POINTER")]
        public const string IOSTREAM_POINTER;

        /**
         * The offset in the {@link SDL.IOStream.IOStream} for the beginning of the font,
         * defaults to 0.
         *
         * @since 3.0.0
         *
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "TTF_PROP_FONT_CREATE_IOSTREAM_OFFSET_NUMBER")]
        public const string IOSTREAM_OFFSET_NUMBER;

        /**
         * If set to true, closing the font should also close the associated
         * {@link SDL.IOStream.IOStream}.
         *
         * @since 3.0.0
         *
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "TTF_PROP_FONT_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN")]
        public const string IOSTREAM_AUTOCLOSE_BOOLEAN;

        /**
        * The point size of the font.
        *
        * Some .fon fonts will have several sizes embedded in the file, so the point size
        * becomes the index of choosing which size. If the value is too high, the last
        * indexed size will be the default.
        *
        * @since 3.0.0
        *
        */
        [Version (since = "3.0.0")]
        [CCode (cname = "TTF_PROP_FONT_CREATE_SIZE_FLOAT")]
        public const string SIZE_FLOAT;

        /**
         * The face index of the font, if the font contains multiple font faces.
         *
         * @since 3.0.0
         *
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "TTF_PROP_FONT_CREATE_FACE_NUMBER")]
        public const string FACE_NUMBER;

        /**
         * The horizontal DPI to use for font rendering, defaults to
         * {@link VERTICAL_DPI_NUMBER} if set, or 72 otherwise.
         *
         * @since 3.0.0
         *
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "TTF_PROP_FONT_CREATE_HORIZONTAL_DPI_NUMBER")]
        public const string HORIZONTAL_DPI_NUMBER;

        /**
         * The horizontal DPI to use for font rendering, defaults to
         * {@link HORIZONTAL_DPI_NUMBER} if set, or 72 otherwise.
         *
         * @since 3.0.0
         *
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "TTF_PROP_FONT_CREATE_VERTICAL_DPI_NUMBER")]
        public const string VERTICAL_DPI_NUMBER;

        /**
         * An optional {@link TTF.Font} that, if set, will be used
         * as the font data source and the initial size and style of
         * the new font.
         *
         * @since 3.0.0
         *
         */
        [Version (since = "3.0.0")]
        [CCode (cname = "TTF_PROP_FONT_CREATE_EXISTING_FONT")]
        public const string EXISTING_FONT;
    } // PropFontCreate
} // SDL.TTF
