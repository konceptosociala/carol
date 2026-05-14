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

/**
 * ''The SDL3 Gfx Library Vala bindings.''
 *
 * This library provides the basic drawing functions such as lines, circles
 * or polygons against SDL3 renderers.
 *
 *  * ''Repository link: '' [[https://github.com/sabdul-khabir/SDL3_gfx]]
 */
namespace SDL.GFX {}

[CCode (cheader_filename = "SDL3_gfx/SDL3_gfxPrimitives.h")]
namespace SDL.GFX.Primitives {
    namespace Version {
        [CCode (cname = "SDL3_GFXPRIMITIVES_MAJOR")]
        public const int MAJOR;

        [CCode (cname = "SDL3_GFXPRIMITIVES_MINOR")]
        public const int MINOR;

        [CCode (cname = "SDL3_GFXPRIMITIVES_MICRO")]
        public const int MICRO;
    }

    // Note: all ___color routines expect the color to be in format 0xRRGGBBAA

    [CCode (cname = "pixelColor")]
    public static bool pixel_color (SDL.Render.Renderer renderer, float x, float y, uint32 color);

    [CCode (cname = "pixelRGBA")]
    public static bool pixel_rgba (SDL.Render.Renderer renderer, float x, float y, uint8 r, uint8 g, uint8 b, uint8 a);

    [CCode (cname = "hlineColor")]
    public static bool h_line_color (SDL.Render.Renderer renderer, float x1, float x2, float y, uint32 color);

    [CCode (cname = "hlineRGBA")]
    public static bool h_line_rgba (SDL.Render.Renderer renderer, float x1, float x2, float y,
        uint8 r, uint8 g, uint8 b, uint8 a);

    [CCode (cname = "vlineColor")]
    public static bool v_line_color (SDL.Render.Renderer renderer, float x, float y1, float y2, uint32 color);

    [CCode (cname = "vlineRGBA")]
    public static bool v_line_rgba (SDL.Render.Renderer renderer, float x, float y1, float y2, uint8 r, uint8 g,
        uint8 b, uint8 a);

    [CCode (cname = "rectangleColor")]
    public static bool rectangle_color (SDL.Render.Renderer renderer, float x1, float y1,
        float x2, float y2, uint32 color);

    [CCode (cname = "rectangleRGBA")]
    public static bool rectangle_rgba (SDL.Render.Renderer renderer, float x1, float y1,
        float x2, float y2, uint8 r, uint8 g, uint8 b, uint8 a);

    [CCode (cname = "roundedRectangleColor")]
    public static bool rounded_rectangle_color (SDL.Render.Renderer renderer, float x1, float y1,
        float x2, float y2, float rad, uint32 color);

    [CCode (cname = "roundedRectangleRGBA")]
    public static bool rounded_rectangle_rgba (SDL.Render.Renderer renderer, float x1, float y1,
        float x2, float y2, float rad, uint8 r, uint8 g, uint8 b, uint8 a);

    [CCode (cname = "boxColor")]
    public static bool box_color (SDL.Render.Renderer renderer, float x1, float y1, float x2, float y2, uint32 color);

    [CCode (cname = "boxRGBA")]
    public static bool box_rgba (SDL.Render.Renderer renderer, float x1, float y1, float x2, float y2,
        uint8 r, uint8 g, uint8 b, uint8 a);

    [CCode (cname = "roundedBoxColor")]
    public static bool rounded_box_color (SDL.Render.Renderer renderer, float x1, float y1, float x2, float y2,
        float rad, uint32 color);

    [CCode (cname = "roundedBoxRGBA")]
    public static bool rounded_box_rgba (SDL.Render.Renderer renderer, float x1, float y1, float x2, float y2,
        float rad, uint8 r, uint8 g, uint8 b, uint8 a);

    [CCode (cname = "lineColor")]
    public static bool line_color (SDL.Render.Renderer renderer, float x1, float y1, float x2, float y2, uint32 color);

    [CCode (cname = "lineRGBA")]
    public static bool line_rgba (SDL.Render.Renderer renderer, float x1, float y1, float x2, float y2,
        uint8 r, uint8 g, uint8 b, uint8 a);

    [CCode (cname = "aalineColor")]
    public static bool aa_line_color (SDL.Render.Renderer renderer, float x1, float y1, float x2, float y2,
        uint32 color);

    [CCode (cname = "aalineRGBA")]
    public static bool aa_line_rgba (SDL.Render.Renderer renderer, float x1, float y1, float x2, float y2,
        uint8 r, uint8 g, uint8 b, uint8 a);

    [CCode (cname = "thickLineColor")]
    public static bool thick_line_color (SDL.Render.Renderer renderer, float x1, float y1, float x2, float y2,
        uint8 width, uint32 color);

    [CCode (cname = "thickLineRGBA")]
    public static bool thick_line_rgba (SDL.Render.Renderer renderer, float x1, float y1, float x2, float y2,
        float width, uint8 r, uint8 g, uint8 b, uint8 a);

    [CCode (cname = "circleColor")]
    public static bool circle_color (SDL.Render.Renderer renderer, float x, float y, float rad, uint32 color);

    [CCode (cname = "circleRGBA")]
    public static bool circle_rgba (SDL.Render.Renderer renderer, float x, float y, float rad, uint8 r, uint8 g,
        uint8 b, uint8 a);

    [CCode (cname = "arcColor")]
    public static bool arc_color (SDL.Render.Renderer renderer, float x, float y, float rad, int32 start, int32 end,
        uint32 color);

    [CCode (cname = "arcRGBA")]
    public static bool arc_rgba (SDL.Render.Renderer renderer, float x, float y, float rad, int32 start, int32 end,
        uint8 r, uint8 g, uint8 b, uint8 a);

    [CCode (cname = "aacircleColor")]
    public static bool aa_circle_color (SDL.Render.Renderer renderer, float x, float y, float rad, uint32 color);

    [CCode (cname = "aacircleRGBA")]
    public static bool aa_circle_rgba (SDL.Render.Renderer renderer, float x, float y, float rad, uint8 r, uint8 g,
        uint8 b, uint8 a);

    [CCode (cname = "filledCircleColor")]
    public static bool filled_circle_color (SDL.Render.Renderer renderer, float x, float y, float r, uint32 color);

    [CCode (cname = "filledCircleRGBA")]
    public static bool filled_circle_rgba (SDL.Render.Renderer renderer, float x, float y, float rad, uint8 r, uint8 g,
        uint8 b, uint8 a);

    [CCode (cname = "ellipse_color")]
    public static bool ellipse_color (SDL.Render.Renderer renderer, float x, float y, float rx, float ry, uint32 color);

    [CCode (cname = "ellipseRGBA")]
    public static bool ellipse_rgba (SDL.Render.Renderer renderer, float x, float y, float rx, float ry,
        uint8 r, uint8 g, uint8 b, uint8 a);

    [CCode (cname = "aaellipseColor")]
    public static bool aa_ellipse_color (SDL.Render.Renderer renderer, float x, float y, float rx, float ry,
        uint32 color);

    [CCode (cname = "aaellipseRGBA")]
    public static bool aa_ellipse_rgba (SDL.Render.Renderer renderer, float x, float y, float rx, float ry,
        uint8 r, uint8 g, uint8 b, uint8 a);

    [CCode (cname = "filledEllipseColor")]
    public static bool filled_ellipse_color (SDL.Render.Renderer renderer, float x, float y, float rx, float ry,
        uint32 color);

    [CCode (cname = "filledEllipseRGBA")]
    public static bool filled_ellipse_rgba (SDL.Render.Renderer renderer, float x, float y, float rx, float ry,
        uint8 r, uint8 g, uint8 b, uint8 a);

    [CCode (cname = "pieColor")]
    public static bool pie_color (SDL.Render.Renderer renderer, float x, float y, float rad, int32 start, int32 end,
        uint32 color);

    [CCode (cname = "pieRGBA")]
    public static bool pie_rgba (SDL.Render.Renderer renderer, float x, float y, float rad, int32 start, int32 end,
        uint8 r, uint8 g, uint8 b, uint8 a);

    [CCode (cname = "filledPieColor")]
    public static bool filled_pie_color (SDL.Render.Renderer renderer, float x, float y, float rad, int32 start,
        int32 end, uint32 color);

    [CCode (cname = "filledPieRGBA")]
    public static bool filled_pie_rgba (SDL.Render.Renderer renderer, float x, float y, float rad, int32 start,
        int32 end, uint8 r, uint8 g, uint8 b, uint8 a);

    [CCode (cname = "trigonColor")]
    public static bool trigon_color (SDL.Render.Renderer renderer, float x1, float y1, float x2, float y2, float x3,
        float y3, uint32 color);

    [CCode (cname = "trigonRGBA")]
    public static bool trigon_rgba (SDL.Render.Renderer renderer, float x1, float y1, float x2, float y2, float x3,
        float y3, uint8 r, uint8 g, uint8 b, uint8 a);

    [CCode (cname = "aatrigonColor")]
    public static bool aa_trigon_color (SDL.Render.Renderer renderer, float x1, float y1, float x2, float y2, float x3,
        float y3, uint32 color);

    [CCode (cname = "aatrigonRGBA")]
    public static bool aa_trigon_rgba (SDL.Render.Renderer renderer, float x1, float y1, float x2, float y2, float x3,
        float y3, uint8 r, uint8 g, uint8 b, uint8 a);

    [CCode (cname = "filledTrigonColor")]
    public static bool filled_trigon_color (SDL.Render.Renderer renderer, float x1, float y1, float x2, float y2,
        float x3, float y3, uint32 color);

    [CCode (cname = "filledTrigonRGBA")]
    public static bool filled_trigon_rgba (SDL.Render.Renderer renderer, float x1, float y1, float x2, float y2,
        float x3, float y3, uint8 r, uint8 g, uint8 b, uint8 a);

    [CCode (cname = "polygonColor")]
    public static bool polygon_color (SDL.Render.Renderer renderer, [CCode (array_length = false)] float[] vx,
        float[] vy, uint32 color);

    [CCode (cname = "polygonRGBA")]
    public static bool polygon_rgba (SDL.Render.Renderer renderer, [CCode (array_length = false)] float[] vx,
        float[] vy, uint8 r, uint8 g, uint8 b, uint8 a);

    [CCode (cname = "aapolygonColor")]
    public static bool aa_polygon_color (SDL.Render.Renderer renderer, [CCode (array_length = false)] float[] vx,
        float[] vy, uint32 color);

    [CCode (cname = "aapolygonRGBA")]
    public static bool aa_polygon_rgba (SDL.Render.Renderer renderer, [CCode (array_length = false)] float[] vx,
        float[] vy, uint8 r, uint8 g, uint8 b, uint8 a);

    [CCode (cname = "filledPolygonColor")]
    public static bool filled_polygon_color (SDL.Render.Renderer renderer, [CCode (array_length = false)] float[] vx,
        float[] vy, uint32 color);

    [CCode (cname = "filledPolygonRGBA")]
    public static bool filled_polygon_rgba (SDL.Render.Renderer renderer, [CCode (array_length = false)] float[] vx,
        float[] vy, uint8 r, uint8 g, uint8 b, uint8 a);

    [CCode (cname = "texturedPolygon")]
    public static bool textured_polygon (SDL.Render.Renderer renderer, [CCode (array_length = false)] float[] vx,
        float[] vy, SDL.Surface.Surface texture, int texture_dx, int texture_dy);

    [CCode (cname = "bezierColor")]
    public static bool bezier_color (SDL.Render.Renderer renderer,
        [CCode (array_length = false)] float[] vx, float[] vy, int s, uint32 color);

    [CCode (cname = "bezierRGBA")]
    public static bool bezier_rgba (SDL.Render.Renderer renderer,
        [CCode (array_length = false)] float[] vx, float[] vy, int s, uint8 r, uint8 g, uint8 b, uint8 a);

    [CCode (cname = "gfxPrimitivesSetFont")]
    public static bool set_font (void* fontdata, uint32 cw, uint32 ch);

    [CCode (cname = "gfxPrimitivesSetFontRotation")]
    public static bool set_font_rotation (uint32 rotation);

    [CCode (cname = "characterColor")]
    public static bool character_color (SDL.Render.Renderer renderer, float x, float y, char c, uint32 color);

    [CCode (cname = "characterRGBA")]
    public static bool character_rgba (SDL.Render.Renderer renderer, float x, float y, char c,
        uint8 r, uint8 g, uint8 b, uint8 a);

    [CCode (cname = "stringColor")]
    public static bool string_color (SDL.Render.Renderer renderer, float x, float y, string s, uint32 color);

    [CCode (cname = "stringRGBA")]
    public static bool string_rgba (SDL.Render.Renderer renderer, float x, float y, string s, uint8 r, uint8 g, uint8 b, uint8 a);

    [CCode (cheader_filename = "SDL3_gfx/SDL3_gfxPrimitives_font.h", cname = "GFX_FONTDATAMAX")]
    public const int FONT_DATA_MAX;
} // SDL.GFX.Primitives

[CCode (cheader_filename = "SDL3_gfx/SDL3_framerate.h")]
namespace SDL.GFX.Framerate {
    [CCode (cname = "FPS_UPPER_LIMIT")]
    public const int FPS_UPPER_LIMIT;

    [CCode (cname = "FPS_LOWER_LIMIT")]
    public const int FPS_LOWER_LIMIT;

    [CCode (cname = "FPS_DEFAULT")]
    public const int FPS_DEFAULT;

    [CCode (cname = "FPSmanager", has_type_id = false)]
    public struct FpsManager {
        public uint32 framecount;
        public float rateticks;
        public uint64 baseticks;
        public uint64 lastticks;
        public uint32 rate;
    } // FpsManager

    [CCode (cname = "SDL_initFramerate")]
    public static void init_framerate (out FpsManager manager);

    [CCode (cname = "SDL_setFramerate")]
    public static int set_framerate (ref FpsManager manager, uint32 rate);

    [CCode (cname = "SDL_getFramerate")]
    public static int get_framerate (FpsManager manager);

    [CCode (cname = "SDL_getFramecount")]
    public static int get_framecount (FpsManager manager);

    [CCode (cname = "SDL_framerateDelay")]
    public static uint64 framerate_delay (ref FpsManager manager);
} // SDL.GFX.Framerate

[CCode (cheader_filename = "SDL3_gfx/SDL3_imageFilter.h")]
namespace SDL.GFX.ImageFilter {
    [CCode (cname = "SDL_imageFilterAdd")]
    public static bool add ([CCode (array_length = false)] uint8[] src1, [CCode (array_length = false)] uint8[] src2,
        uint8[] dest);

    [CCode (cname = "SDL_imageFilterMean")]
    public static bool mean ([CCode (array_length = false)] uint8[] src1, [CCode (array_length = false)] uint8[] src2,
        uint8[] dest);

    [CCode (cname = "SDL_imageFilterSub")]
    public static bool sub ([CCode (array_length = false)] uint8[] src1, [CCode (array_length = false)] uint8[] src2,
        uint8[] dest);

    [CCode (cname = "SDL_imageFilterAbsDiff")]
    public static bool abs_diff ([CCode (array_length = false)] uint8[] src1, [CCode (array_length = false)] uint8[] src2,
        uint8[] dest);

    [CCode (cname = "SDL_imageFilterMult")]
    public static bool mult ([CCode (array_length = false)] uint8[] src1, [CCode (array_length = false)] uint8[] src2,
        uint8[] dest);

    [CCode (cname = "SDL_imageFilterMultUnbound")]
    public static bool mult_unbound ([CCode (array_length = false)] uint8[] src1,
        [CCode (array_length = false)] uint8[] src2, uint8[] dest);

    [CCode (cname = "SDL_imageFilterMultInv")]
    public static bool mult_inv ([CCode (array_length = false)] uint8[] src1,
        [CCode (array_length = false)] uint8[] src2, uint8[] dest);

    [CCode (cname = "SDL_imageFilterMultDivby2")]
    public static bool mult_div_by_2 ([CCode (array_length = false)] uint8[] src1,
        [CCode (array_length = false)] uint8[] src2, uint8[] dest);

    [CCode (cname = "SDL_imageFilterMultDivby4")]
    public static bool mult_div_by_4 ([CCode (array_length = false)] uint8[] src1,
        [CCode (array_length = false)] uint8[] src2, uint8[] dest);

    [CCode (cname = "SDL_imageFilterMultByByte")]
    public static bool mult_by_byte ([CCode (array_length = false)] uint8[] src1, uint8[] dest, uint8 c);

    [CCode (cname = "SDL_imageFilterBitAnd")]
    public static bool bit_and ([CCode (array_length = false)] uint8[] src1, [CCode (array_length = false)] uint8[] src2,
        uint8[] dest);

    [CCode (cname = "SDL_imageFilterBitOr")]
    public static bool bit_or ([CCode (array_length = false)] uint8[] src1, [CCode (array_length = false)] uint8[] src2,
        uint8[] dest);

    [CCode (cname = "SDL_imageFilterDiv")]
    public static bool div ([CCode (array_length = false)] uint8[] src1, [CCode (array_length = false)] uint8[] src2,
        uint8[] dest);

    [CCode (cname = "SDL_imageFilterBitNegation")]
    public static bool bit_negation ([CCode (array_length = false)] uint8[] src1, uint8[] dest);

    [CCode (cname = "SDL_imageFilterAddByte")]
    public static bool add_byte ([CCode (array_length = false)] uint8[] src1, uint8[] dest, uint8 c);

    [CCode (cname = "SDL_imageFilterAddUint")]
    public static bool add_uint ([CCode (array_length = false)] uint8[] src1, uint8[] dest, uint bpp, uint c);

    [CCode (cname = "SDL_imageFilterAddByteToHalf")]
    public static bool add_byte_to_half ([CCode (array_length = false)] uint8[] src1, uint8[] dest, uint8 c);

    [CCode (cname = "SDL_imageFilterSubByte")]
    public static bool sub_byte ([CCode (array_length = false)] uint8[] src1, uint8[] dest, uint8 c);

    [CCode (cname = "SDL_imageFilterSubUint")]
    public static bool sub_uint ([CCode (array_length = false)] uint8[] src1, uint8[] dest, uint bpp, uint c);

    [CCode (cname = "SDL_imageFilterShiftRight")]
    public static bool shift_right ([CCode (array_length = false)] uint8[] src1, uint8[] dest, uint8 n);

    [CCode (cname = "SDL_imageFilterShiftRightUint")]
    public static bool shift_right_uint ([CCode (array_length = false)] uint8[] src1, uint8[] dest, uint bpp, uint8 n);

    [CCode (cname = "SDL_imageFilterShiftRightAndMultByByte")]
    public static bool shift_right_and_mult_by_byte ([CCode (array_length = false)] uint8[] src1, uint8[] dest, uint8 n,
        uint8 c);

    [CCode (cname = "SDL_imageFilterShiftLeft")]
    public static bool shift_left ([CCode (array_length = false)] uint8[] src1, uint8[] dest, uint8 n);

    [CCode (cname = "SDL_imageFilterShiftLeftByte")]
    public static bool shift_left_byte ([CCode (array_length = false)] uint8[] src1, uint8[] dest, uint8 n);

    [CCode (cname = "SDL_imageFilterShiftLeftUint")]
    public static bool shift_left_uint ([CCode (array_length = false)] uint8[] src1, uint8[] dest, uint bpp, uint8 n);

    [CCode (cname = "SDL_imageFilterBinarizeUsingThreshold")]
    public static bool binarize_using_threshold ([CCode (array_length = false)] uint8[] src1, uint8[] dest, uint8 t);

    [CCode (cname = "SDL_imageFilterClipToRange")]
    public static bool clip_to_range ([CCode (array_length = false)] uint8[] src1, uint8[] dest, uint8 t_min,
        uint8 t_max);

    [CCode (cname = "SDL_imageFilterNormalizeLinear")]
    public static bool normalize_linear ([CCode (array_length = false)] uint8[] src, uint8[] dest, int c_min, int c_max,
        int n_min, int n_max);
} // SDL.GFX.ImageFilter

[CCode (cheader_filename = "SDL3_gfx/SDL3_rotozoom.h")]
namespace SDL.GFX.Rotozoom {
    [CCode (cname = "int", cprefix = "SMOOTHING_", has_type_id = false)]
    public enum Smoothing {
        OFF,
        ON
    }

    [CCode (cname = "rotozoomSurface")]
    public static SDL.Surface.Surface rotozoom_surface (SDL.Surface.Surface src, double angle,
        double zoom, Smoothing smooth);

    [CCode (cname = "rotozoomSurfaceXY")]
    public static SDL.Surface.Surface rotozoom_surface_xy (SDL.Surface.Surface src, double angle,
        double zoom_x, double zoom_y, Smoothing smooth);

    [CCode (cname = "rotozoomSurfaceSize")]
    public static void rotozoom_surface_size (int width, int height, double angle, double zoom, out int dst_width,
        out int dst_height);

    [CCode (cname = "rotozoomSurfaceSizeXY")]
    public static void rotozoom_surface_size_xy (int width, int height, double angle, double zoom_x, double zoom_y,
        out int dst_width, out int dst_height);

    [CCode (cname = "zoomSurface")]
    public static SDL.Surface.Surface zoom_surface (SDL.Surface.Surface src, double zoom_x, double zoom_y,
        Smoothing smooth);

    [CCode (cname = "zoomSurfaceSize")]
    public static void zoom_surface_size (int width, int height, double zoom_x, double zoom_y, out int dst_width,
        out int dst_height);

    [CCode (cname = "shrinkSurface")]
    public static SDL.Surface.Surface shrink_surface (SDL.Surface.Surface src, int factor_x, int factor_y);

    [CCode (cname = "rotateSurface90Degrees")]
    public static SDL.Surface.Surface rotate_surface_90_degrees (SDL.Surface.Surface src, int num_clockwise_turns);
} // SDL.GFX.Rotozoom
