[CCode (cheader_filename = "tmx.h")]
namespace Tmx {
	[CCode (cname = "TMX_FLIPPED_HORIZONTALLY")]
	public const uint32 FLIPPED_HORIZONTALLY;
	[CCode (cname = "TMX_FLIPPED_VERTICALLY")]
	public const uint32 FLIPPED_VERTICALLY;
	[CCode (cname = "TMX_FLIPPED_DIAGONALLY")]
	public const uint32 FLIPPED_DIAGONALLY;
	[CCode (cname = "TMX_FLIP_BITS_REMOVAL")]
	public const uint32 FLIP_BITS_REMOVAL;

	[CCode (cname = "tmx_alloc_func")]
	public static AllocFunc alloc_func;
	[CCode (cname = "tmx_free_func")]
	public static FreeFunc free_func;
	[CCode (cname = "tmx_img_load_func")]
	public static ImgLoadFunc img_load_func;
	[CCode (cname = "tmx_img_free_func")]
	public static ImgFreeFunc img_free_func;

	[CCode (cname = "tmx_alloc_func", has_target = false)]
	public delegate void* AllocFunc (void* address, size_t len);
	[CCode (cname = "tmx_free_func", has_target = false)]
	public delegate void FreeFunc (void* address);
	[CCode (cname = "tmx_img_load_func", has_target = false)]
	public delegate void* ImgLoadFunc (string path);
	[CCode (cname = "tmx_img_free_func", has_target = false)]
	public delegate void ImgFreeFunc (void* address);

	[CCode (cname = "enum tmx_map_orient", cprefix = "O_", has_type_id = false)]
	public enum MapOrient {
		NONE,
		ORT,
		ISO,
		STA,
		HEX
	}

	[CCode (cname = "enum tmx_map_renderorder", cprefix = "R_", has_type_id = false)]
	public enum MapRenderOrder {
		NONE,
		RIGHTDOWN,
		RIGHTUP,
		LEFTDOWN,
		LEFTUP
	}

	[CCode (cname = "enum tmx_stagger_index", cprefix = "SI_", has_type_id = false)]
	public enum StaggerIndex {
		NONE,
		EVEN,
		ODD
	}

	[CCode (cname = "enum tmx_stagger_axis", cprefix = "SA_", has_type_id = false)]
	public enum StaggerAxis {
		NONE,
		X,
		Y
	}

	[CCode (cname = "enum tmx_obj_alignment", cprefix = "OA_", has_type_id = false)]
	public enum ObjAlignment {
		NONE,
		TOP,
		LEFT,
		BOTTOM,
		RIGHT,
		CENTER,
		TOPLEFT,
		TOPRIGHT,
		BOTTOMLEFT,
		BOTTOMRIGHT
	}

	[CCode (cname = "enum tmx_layer_type", cprefix = "L_", has_type_id = false)]
	public enum LayerType {
		NONE,
		LAYER,
		OBJGR,
		IMAGE,
		GROUP
	}

	[CCode (cname = "enum tmx_objgr_draworder", cprefix = "G_", has_type_id = false)]
	public enum ObjgrDrawOrder {
		NONE,
		INDEX,
		TOPDOWN
	}

	[CCode (cname = "enum tmx_obj_type", cprefix = "OT_", has_type_id = false)]
	public enum ObjType {
		NONE,
		SQUARE,
		POLYGON,
		POLYLINE,
		ELLIPSE,
		TILE,
		TEXT,
		POINT
	}

	[CCode (cname = "enum tmx_property_type", cprefix = "PT_", has_type_id = false)]
	public enum PropertyType {
		NONE,
		INT,
		FLOAT,
		BOOL,
		STRING,
		COLOR,
		FILE,
		OBJECT,
		CUSTOM
	}

	[CCode (cname = "enum tmx_horizontal_align", cprefix = "HA_", has_type_id = false)]
	public enum HorizontalAlign {
		NONE,
		LEFT,
		CENTER,
		RIGHT,
		JUSTIFY
	}

	[CCode (cname = "enum tmx_vertical_align", cprefix = "VA_", has_type_id = false)]
	public enum VerticalAlign {
		NONE,
		TOP,
		CENTER,
		BOTTOM
	}

	[CCode (cname = "enum tmx_tile_render_size", cprefix = "TRS_", has_type_id = false)]
	public enum TileRenderSize {
		NONE,
		TILE,
		GRID
	}

	[CCode (cname = "enum tmx_fill_mode", cprefix = "FM_", has_type_id = false)]
	public enum FillMode {
		NONE,
		STRETCH,
		PRESERVE_ASPECT_FIT
	}

	[CCode (cname = "tmx_user_data", has_type_id = false)]
	public struct UserData {
		public int integer;
		public float decimal;
		public void* pointer;
	}

	[CCode (cname = "tmx_property_value", has_type_id = false)]
	public struct PropertyValue {
		public int integer;
		public int boolean;
		public int object_id;
		public float decimal;
		public unowned string? string;
		public unowned string? file;
		public uint32 color;
		public Properties? properties;
	}

	[CCode (cname = "tmx_properties", free_function = "", has_type_id = false)]
	[Compact]
	public class Properties {
	}

	[CCode (cname = "struct _tmx_prop", has_type_id = false)]
	[Compact]
	public class Property {
		public unowned string? name;
		public unowned string? propertytype;
		public PropertyType type;
		public PropertyValue value;
	}

	[CCode (cname = "struct _tmx_img", has_type_id = false)]
	[Compact]
	public class Image {
		public unowned string? source;
		public uint trans;
		public int uses_trans;
		public ulong width;
		public ulong height;
		public void* resource_image;
	}

	[CCode (cname = "struct _tmx_frame", has_type_id = false)]
	[Compact]
	public class AnimFrame {
		public uint tile_id;
		public uint duration;
	}

	[CCode (cname = "struct _tmx_tile", has_type_id = false)]
	[Compact]
	public class Tile {
		public uint id;
		public TileSet? tileset;
		public uint ul_x;
		public uint ul_y;
		public uint width;
		public uint height;
		public Image? image;
		public Object? collision;
		public uint animation_len;
		public AnimFrame? animation;
		public unowned string? type;
		public Properties? properties;
		public UserData user_data;
	}

	[CCode (cname = "struct _tmx_ts", has_type_id = false)]
	[Compact]
	public class TileSet {
		public unowned string? name;
		public unowned string? class_type;
		public uint tile_width;
		public uint tile_height;
		public uint spacing;
		public uint margin;
		public int x_offset;
		public int y_offset;
		public ObjAlignment objectalignment;
		public uint tilecount;
		public Image? image;
		public TileRenderSize tile_render_size;
		public FillMode fill_mode;
		public UserData user_data;
		public Properties? properties;
		public Tile? tiles;
	}

	[CCode (cname = "struct _tmx_ts_list", has_type_id = false)]
	[Compact]
	public class TilesetList {
		public int is_embedded;
		public uint firstgid;
		public unowned string? source;
		public TileSet? tileset;
		public TilesetList? next;
	}

	[CCode (cname = "struct _tmx_shape", has_type_id = false)]
	[Compact]
	public class Shape {
		public double** points;
		public int points_len;
	}

	[CCode (cname = "struct _tmx_text", has_type_id = false)]
	[Compact]
	public class Text {
		public unowned string? fontfamily;
		public int pixelsize;
		public uint32 color;
		public int wrap;
		public int bold;
		public int italic;
		public int underline;
		public int strikeout;
		public int kerning;
		public HorizontalAlign halign;
		public VerticalAlign valign;
		public unowned string? text;
	}

	[CCode (cname = "struct _tmx_obj", has_type_id = false)]
	[Compact]
	public class Object {
		public uint id;
		public ObjType obj_type;
		public double x;
		public double y;
		public double width;
		public double height;
		public uint gid;
		public bool visible;
		public double rotation;
		public unowned string? name;
		public unowned string? type;
		public Template? template_ref;
		public Properties? properties;
		public Object? next;
		
		[CCode (cname = "content.shape")]
		public Shape? content_shape;
		[CCode (cname = "content.text")]
		public Text? content_text;
	}

	[CCode (cname = "struct _tmx_objgr", has_type_id = false)]
	[Compact]
	public class ObjectGroup {
		public uint32 color;
		public ObjgrDrawOrder draworder;
		public Object? head;
	}

	[CCode (cname = "struct _tmx_templ", has_type_id = false)]
	[Compact]
	public class Template {
		public int is_embedded;
		public TilesetList? tileset_ref;
		public Object? object;
	}

	[CCode (cname = "struct _tmx_layer", has_type_id = false)]
	[Compact]
	public class Layer {
		public int id;
		public unowned string? name;
		public unowned string? class_type;
		public double opacity;
		public bool visible;
		public int offsetx;
		public int offsety;
		public double parallaxx;
		public double parallaxy;
		public uint32 tintcolor;
		public int repeatx;
		public int repeaty;
		public LayerType type;
		public UserData user_data;
		public Properties? properties;
		public Layer? next;

		[CCode (cname = "content.gids")]
		public uint32* content_gids;
		[CCode (cname = "content.objgr")]
		public ObjectGroup? content_objgr;
		[CCode (cname = "content.image")]
		public Image? content_image;
		[CCode (cname = "content.group_head")]
		public Layer? content_group_head;
	}

	[CCode (cname = "struct _tmx_map", free_function = "tmx_map_free", has_type_id = false)]
	[Compact]
	public class Map {
		public unowned string? format_version;
		public unowned string? class_type;
		public MapOrient orient;
		public uint width;
		public uint height;
		public uint tile_width;
		public uint tile_height;
		public StaggerIndex stagger_index;
		public StaggerAxis stagger_axis;
		public int hexsidelength;
		public double parallaxoriginx;
		public double parallaxoriginy;
		public uint32 backgroundcolor;
		public MapRenderOrder renderorder;
		public Properties? properties;
		public TilesetList? ts_head;
		public Layer? ly_head;
		public uint tilecount;
		[CCode (array_length_cname = "tilecount")]
		public Tile*[] tiles;
		public UserData user_data;

		[CCode (cname = "tmx_load")]
		public Map (string path);
		[CCode (cname = "tmx_load_buffer")]
		public Map.from_buffer (string buffer, int len);
		[CCode (cname = "tmx_load_fd")]
		public Map.from_fd (int fd);

		[CCode (cname = "tmx_get_tile")]
		public Tile? get_tile (uint gid);
		[CCode (cname = "tmx_find_layer_by_id")]
		public Layer? find_layer_by_id (int id);
		[CCode (cname = "tmx_find_layer_by_name")]
		public Layer? find_layer_by_name (string name);
		[CCode (cname = "tmx_find_object_by_id")]
		public Object? find_object_by_id (uint id);
		[CCode (cname = "tmx_find_tileset_by_name")]
		public TilesetList? find_tileset_by_name (string name);
	}

	[CCode (cname = "tmx_read_functor", has_target = false)]
	public delegate int ReadFunctor (void* userdata, [CCode (array_length_type = "int")] char[] buffer);

	[CCode (cname = "tmx_load_callback")]
	public Map? load_callback (ReadFunctor callback, void* userdata);

	[CCode (cname = "tmx_get_property")]
	public Property? get_property (Properties hash, string key);

	[CCode (cname = "tmx_property_functor", has_target = false)]
	public delegate void PropertyFunctor (Property property, void* userdata);

	[CCode (cname = "tmx_property_foreach")]
	public void property_foreach (Properties hash, PropertyFunctor callback, void* userdata);

	[CCode (cname = "tmx_col_bytes", has_type_id = false)]
	[SimpleType]
	public struct ColBytes {
		public uint8 r;
		public uint8 g;
		public uint8 b;
		public uint8 a;
	}

	[CCode (cname = "tmx_col_floats", has_type_id = false)]
	[SimpleType]
	public struct ColFloats {
		public float r;
		public float g;
		public float b;
		public float a;
	}

	[CCode (cname = "tmx_col_to_bytes")]
	public ColBytes col_to_bytes (uint32 color);
	[CCode (cname = "tmx_col_to_floats")]
	public ColFloats col_to_floats (uint32 color);

	[CCode (cname = "tmx_resource_manager", free_function = "tmx_free_resource_manager", has_type_id = false)]
	[Compact]
	public class ResourceManager {
		[CCode (cname = "tmx_make_resource_manager")]
		public ResourceManager ();

		[CCode (cname = "tmx_load_tileset")]
		public int load_tileset (string path);
		[CCode (cname = "tmx_load_tileset_buffer")]
		public int load_tileset_buffer (string buffer, int len, string key);
		[CCode (cname = "tmx_load_tileset_fd")]
		public int load_tileset_fd (int fd, string key);
		[CCode (cname = "tmx_load_tileset_callback")]
		public int load_tileset_callback (ReadFunctor callback, void* userdata, string key);

		[CCode (cname = "tmx_load_template")]
		public int load_template (string path);
		[CCode (cname = "tmx_load_template_buffer")]
		public int load_template_buffer (string buffer, int len, string key);
		[CCode (cname = "tmx_load_template_fd")]
		public int load_template_fd (int fd, string key);
		[CCode (cname = "tmx_load_template_callback")]
		public int load_template_callback (ReadFunctor callback, void* userdata, string key);

		[CCode (cname = "tmx_rcmgr_load")]
		public Map? load (string path);
		[CCode (cname = "tmx_rcmgr_load_buffer")]
		public Map? load_buffer (string buffer, int len);
		[CCode (cname = "tmx_rcmgr_load_fd")]
		public Map? load_fd (int fd);
		[CCode (cname = "tmx_rcmgr_load_callback")]
		public Map? load_callback (ReadFunctor callback, void* userdata);

		[CCode (cname = "tmx_rcmgr_load_buffer_vpath")]
		public Map? load_buffer_vpath (string buffer, int len, string vpath);
		[CCode (cname = "tmx_rcmgr_load_fd_vpath")]
		public Map? load_fd_vpath (int fd, string vpath);
		[CCode (cname = "tmx_rcmgr_load_callback_vpath")]
		public Map? load_callback_vpath (ReadFunctor callback, string vpath, void* userdata);
	}

	[CCode (cname = "enum _tmx_error_codes", cprefix = "E_", has_type_id = false)]
	public enum ErrorCode {
		NONE,
		UNKN,
		INVAL,
		ALLOC,
		ACCESS,
		NOENT,
		FORMAT,
		ENCCMP,
		FONCT,
		BDATA,
		ZDATA,
		XDATA,
		ZSDATA,
		CDATA,
		MISSEL,
		RANGE
	}

	[CCode (cname = "tmx_errno")]
	public static ErrorCode errno;

	[CCode (cname = "tmx_perror")]
	public void perror (string? prefix);
	[CCode (cname = "tmx_strerr")]
	public unowned string strerr ();
}

