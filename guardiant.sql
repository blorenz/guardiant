--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO brandon;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO brandon;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO brandon;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO brandon;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO brandon;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO brandon;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO brandon;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO brandon;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO brandon;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO brandon;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO brandon;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO brandon;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: cms_aliaspluginmodel; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE cms_aliaspluginmodel (
    cmsplugin_ptr_id integer NOT NULL,
    plugin_id integer,
    alias_placeholder_id integer
);


ALTER TABLE public.cms_aliaspluginmodel OWNER TO brandon;

--
-- Name: cms_cmsplugin; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE cms_cmsplugin (
    id integer NOT NULL,
    placeholder_id integer,
    parent_id integer,
    "position" smallint,
    language character varying(15) NOT NULL,
    plugin_type character varying(50) NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    changed_date timestamp with time zone NOT NULL,
    level integer NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    CONSTRAINT cms_cmsplugin_level_check CHECK ((level >= 0)),
    CONSTRAINT cms_cmsplugin_lft_check CHECK ((lft >= 0)),
    CONSTRAINT cms_cmsplugin_position_check CHECK (("position" >= 0)),
    CONSTRAINT cms_cmsplugin_rght_check CHECK ((rght >= 0)),
    CONSTRAINT cms_cmsplugin_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.cms_cmsplugin OWNER TO brandon;

--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE cms_cmsplugin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_cmsplugin_id_seq OWNER TO brandon;

--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE cms_cmsplugin_id_seq OWNED BY cms_cmsplugin.id;


--
-- Name: cms_globalpagepermission; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE cms_globalpagepermission (
    id integer NOT NULL,
    user_id integer,
    group_id integer,
    can_change boolean NOT NULL,
    can_add boolean NOT NULL,
    can_delete boolean NOT NULL,
    can_change_advanced_settings boolean NOT NULL,
    can_publish boolean NOT NULL,
    can_change_permissions boolean NOT NULL,
    can_move_page boolean NOT NULL,
    can_view boolean NOT NULL,
    can_recover_page boolean NOT NULL
);


ALTER TABLE public.cms_globalpagepermission OWNER TO brandon;

--
-- Name: cms_globalpagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE cms_globalpagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_globalpagepermission_id_seq OWNER TO brandon;

--
-- Name: cms_globalpagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE cms_globalpagepermission_id_seq OWNED BY cms_globalpagepermission.id;


--
-- Name: cms_globalpagepermission_sites; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE cms_globalpagepermission_sites (
    id integer NOT NULL,
    globalpagepermission_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.cms_globalpagepermission_sites OWNER TO brandon;

--
-- Name: cms_globalpagepermission_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE cms_globalpagepermission_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_globalpagepermission_sites_id_seq OWNER TO brandon;

--
-- Name: cms_globalpagepermission_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE cms_globalpagepermission_sites_id_seq OWNED BY cms_globalpagepermission_sites.id;


--
-- Name: cms_page; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE cms_page (
    id integer NOT NULL,
    created_by character varying(70) NOT NULL,
    changed_by character varying(70) NOT NULL,
    parent_id integer,
    creation_date timestamp with time zone NOT NULL,
    changed_date timestamp with time zone NOT NULL,
    publication_date timestamp with time zone,
    publication_end_date timestamp with time zone,
    in_navigation boolean NOT NULL,
    soft_root boolean NOT NULL,
    reverse_id character varying(40),
    navigation_extenders character varying(80),
    template character varying(100) NOT NULL,
    site_id integer NOT NULL,
    login_required boolean NOT NULL,
    limit_visibility_in_menu smallint,
    is_home boolean NOT NULL,
    application_urls character varying(200),
    application_namespace character varying(200),
    level integer NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    publisher_is_draft boolean NOT NULL,
    publisher_public_id integer,
    languages character varying(255),
    revision_id integer NOT NULL,
    xframe_options integer NOT NULL,
    CONSTRAINT cms_page_level_check CHECK ((level >= 0)),
    CONSTRAINT cms_page_lft_check CHECK ((lft >= 0)),
    CONSTRAINT cms_page_revision_id_check CHECK ((revision_id >= 0)),
    CONSTRAINT cms_page_rght_check CHECK ((rght >= 0)),
    CONSTRAINT cms_page_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.cms_page OWNER TO brandon;

--
-- Name: cms_page_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE cms_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_page_id_seq OWNER TO brandon;

--
-- Name: cms_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE cms_page_id_seq OWNED BY cms_page.id;


--
-- Name: cms_page_placeholders; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE cms_page_placeholders (
    id integer NOT NULL,
    page_id integer NOT NULL,
    placeholder_id integer NOT NULL
);


ALTER TABLE public.cms_page_placeholders OWNER TO brandon;

--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE cms_page_placeholders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_page_placeholders_id_seq OWNER TO brandon;

--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE cms_page_placeholders_id_seq OWNED BY cms_page_placeholders.id;


--
-- Name: cms_pagepermission; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE cms_pagepermission (
    id integer NOT NULL,
    user_id integer,
    group_id integer,
    can_change boolean NOT NULL,
    can_add boolean NOT NULL,
    can_delete boolean NOT NULL,
    can_change_advanced_settings boolean NOT NULL,
    can_publish boolean NOT NULL,
    can_change_permissions boolean NOT NULL,
    can_move_page boolean NOT NULL,
    can_view boolean NOT NULL,
    grant_on integer NOT NULL,
    page_id integer
);


ALTER TABLE public.cms_pagepermission OWNER TO brandon;

--
-- Name: cms_pagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE cms_pagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_pagepermission_id_seq OWNER TO brandon;

--
-- Name: cms_pagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE cms_pagepermission_id_seq OWNED BY cms_pagepermission.id;


--
-- Name: cms_pageuser; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE cms_pageuser (
    user_ptr_id integer NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public.cms_pageuser OWNER TO brandon;

--
-- Name: cms_pageusergroup; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE cms_pageusergroup (
    group_ptr_id integer NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public.cms_pageusergroup OWNER TO brandon;

--
-- Name: cms_placeholder; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE cms_placeholder (
    id integer NOT NULL,
    slot character varying(50) NOT NULL,
    default_width smallint,
    CONSTRAINT cms_placeholder_default_width_check CHECK ((default_width >= 0))
);


ALTER TABLE public.cms_placeholder OWNER TO brandon;

--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE cms_placeholder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_placeholder_id_seq OWNER TO brandon;

--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE cms_placeholder_id_seq OWNED BY cms_placeholder.id;


--
-- Name: cms_placeholderreference; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE cms_placeholderreference (
    cmsplugin_ptr_id integer NOT NULL,
    name character varying(255) NOT NULL,
    placeholder_ref_id integer
);


ALTER TABLE public.cms_placeholderreference OWNER TO brandon;

--
-- Name: cms_staticplaceholder; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE cms_staticplaceholder (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    draft_id integer,
    public_id integer,
    dirty boolean NOT NULL,
    creation_method character varying(20) NOT NULL,
    site_id integer
);


ALTER TABLE public.cms_staticplaceholder OWNER TO brandon;

--
-- Name: cms_staticplaceholder_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE cms_staticplaceholder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_staticplaceholder_id_seq OWNER TO brandon;

--
-- Name: cms_staticplaceholder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE cms_staticplaceholder_id_seq OWNED BY cms_staticplaceholder.id;


--
-- Name: cms_title; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE cms_title (
    id integer NOT NULL,
    language character varying(15) NOT NULL,
    title character varying(255) NOT NULL,
    page_title character varying(255),
    menu_title character varying(255),
    meta_description text,
    slug character varying(255) NOT NULL,
    path character varying(255) NOT NULL,
    has_url_overwrite boolean NOT NULL,
    redirect character varying(255),
    page_id integer NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    published boolean NOT NULL,
    publisher_is_draft boolean NOT NULL,
    publisher_public_id integer,
    publisher_state smallint NOT NULL
);


ALTER TABLE public.cms_title OWNER TO brandon;

--
-- Name: cms_title_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE cms_title_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_title_id_seq OWNER TO brandon;

--
-- Name: cms_title_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE cms_title_id_seq OWNED BY cms_title.id;


--
-- Name: cms_usersettings; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE cms_usersettings (
    id integer NOT NULL,
    user_id integer NOT NULL,
    language character varying(10) NOT NULL,
    clipboard_id integer
);


ALTER TABLE public.cms_usersettings OWNER TO brandon;

--
-- Name: cms_usersettings_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE cms_usersettings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_usersettings_id_seq OWNER TO brandon;

--
-- Name: cms_usersettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE cms_usersettings_id_seq OWNED BY cms_usersettings.id;


--
-- Name: cmsplugin_contact_contact; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE cmsplugin_contact_contact (
    cmsplugin_ptr_id integer NOT NULL,
    site_email character varying(75) NOT NULL,
    thanks text NOT NULL,
    submit character varying(30) NOT NULL,
    spam_protection_method smallint NOT NULL,
    akismet_api_key character varying(255) NOT NULL,
    recaptcha_public_key character varying(255) NOT NULL,
    recaptcha_private_key character varying(255) NOT NULL,
    recaptcha_theme character varying(20) NOT NULL,
    form_name character varying(60) NOT NULL,
    form_layout character varying(255) NOT NULL,
    redirect_url character varying(200) NOT NULL
);


ALTER TABLE public.cmsplugin_contact_contact OWNER TO brandon;

--
-- Name: cmsplugin_file_gallery_downloadablefile; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE cmsplugin_file_gallery_downloadablefile (
    id integer NOT NULL,
    inline_ordering_position integer,
    gallery_id integer NOT NULL,
    src character varying(100),
    src_height smallint,
    src_width smallint,
    title character varying(255),
    alt text,
    link character varying(255),
    extended_content text,
    author character varying(255),
    subtitle character varying(255),
    downloadable_file character varying(255) NOT NULL,
    CONSTRAINT cmsplugin_file_gallery_downloadablefile_src_height_check CHECK ((src_height >= 0)),
    CONSTRAINT cmsplugin_file_gallery_downloadablefile_src_width_check CHECK ((src_width >= 0))
);


ALTER TABLE public.cmsplugin_file_gallery_downloadablefile OWNER TO brandon;

--
-- Name: cmsplugin_file_gallery_downloadablefile_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE cmsplugin_file_gallery_downloadablefile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cmsplugin_file_gallery_downloadablefile_id_seq OWNER TO brandon;

--
-- Name: cmsplugin_file_gallery_downloadablefile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE cmsplugin_file_gallery_downloadablefile_id_seq OWNED BY cmsplugin_file_gallery_downloadablefile.id;


--
-- Name: cmsplugin_file_gallery_filegalleryplugin; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE cmsplugin_file_gallery_filegalleryplugin (
    cmsplugin_ptr_id integer NOT NULL,
    title character varying(255) NOT NULL,
    template character varying(255) NOT NULL
);


ALTER TABLE public.cmsplugin_file_gallery_filegalleryplugin OWNER TO brandon;

--
-- Name: cmsplugin_gallery_galleryplugin; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE cmsplugin_gallery_galleryplugin (
    cmsplugin_ptr_id integer NOT NULL,
    title character varying(255) NOT NULL,
    slide_duration double precision NOT NULL,
    fade_duration double precision NOT NULL,
    template character varying(255) NOT NULL
);


ALTER TABLE public.backup_cmsplugin_gallery_galleryplugin OWNER TO brandon;

--
-- Name: cmsplugin_gallery_image; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE cmsplugin_gallery_image (
    id integer NOT NULL,
    inline_ordering_position integer,
    gallery_id integer NOT NULL,
    src character varying(100) NOT NULL,
    src_height smallint,
    src_width smallint,
    title character varying(255),
    alt text,
    link character varying(255),
    extended_content text,
    CONSTRAINT cmsplugin_gallery_image_src_height_check CHECK ((src_height >= 0)),
    CONSTRAINT cmsplugin_gallery_image_src_width_check CHECK ((src_width >= 0))
);


ALTER TABLE public.backup_cmsplugin_gallery_image OWNER TO brandon;

--
-- Name: cmsplugin_gallery_image_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE cmsplugin_gallery_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cmsplugin_gallery_image_id_seq OWNER TO brandon;

--
-- Name: cmsplugin_gallery_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE cmsplugin_gallery_image_id_seq OWNED BY cmsplugin_gallery_image.id;


--
-- Name: cmsplugin_galleryplugin; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE cmsplugin_galleryplugin (
    cmsplugin_ptr_id integer NOT NULL,
    template character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    slide_duration double precision NOT NULL,
    fade_duration double precision NOT NULL
);


ALTER TABLE public.backup_cmsplugin_galleryplugin OWNER TO brandon;

--
-- Name: cmsplugin_image_gallery_galleryimage; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE cmsplugin_image_gallery_galleryimage (
    id integer NOT NULL,
    inline_ordering_position integer,
    gallery_id integer NOT NULL,
    src character varying(100) NOT NULL,
    src_height smallint,
    src_width smallint,
    title character varying(255),
    alt text,
    link character varying(255),
    extended_content text,
    CONSTRAINT cmsplugin_image_gallery_galleryimage_src_height_check CHECK ((src_height >= 0)),
    CONSTRAINT cmsplugin_image_gallery_galleryimage_src_width_check CHECK ((src_width >= 0))
);


ALTER TABLE public.backup_cmsplugin_image_gallery_galleryimage OWNER TO brandon;

--
-- Name: cmsplugin_image_gallery_galleryimage_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE cmsplugin_image_gallery_galleryimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cmsplugin_image_gallery_galleryimage_id_seq OWNER TO brandon;

--
-- Name: cmsplugin_image_gallery_galleryimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE cmsplugin_image_gallery_galleryimage_id_seq OWNED BY cmsplugin_image_gallery_galleryimage.id;


--
-- Name: cmsplugin_image_gallery_imagegalleryplugin; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE cmsplugin_image_gallery_imagegalleryplugin (
    cmsplugin_ptr_id integer NOT NULL,
    title character varying(255) NOT NULL,
    slide_duration double precision NOT NULL,
    fade_duration double precision NOT NULL,
    template character varying(255) NOT NULL
);


ALTER TABLE public.backup_cmsplugin_image_gallery_imagegalleryplugin OWNER TO brandon;

--
-- Name: cmsplugin_search_searchpluginconfig; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE cmsplugin_search_searchpluginconfig (
    cmsplugin_ptr_id integer NOT NULL,
    search_identifier character varying(50) NOT NULL,
    template character varying(255) NOT NULL
);


ALTER TABLE public.cmsplugin_search_searchpluginconfig OWNER TO brandon;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO brandon;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO brandon;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO brandon;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO brandon;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO brandon;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO brandon;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO brandon;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO brandon;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO brandon;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: djangocms_file_file; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE djangocms_file_file (
    cmsplugin_ptr_id integer NOT NULL,
    file character varying(100) NOT NULL,
    title character varying(255),
    target character varying(100) NOT NULL
);


ALTER TABLE public.djangocms_file_file OWNER TO brandon;

--
-- Name: djangocms_googlemap_googlemap; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE djangocms_googlemap_googlemap (
    cmsplugin_ptr_id integer NOT NULL,
    title character varying(100),
    address character varying(150) NOT NULL,
    zipcode character varying(30) NOT NULL,
    city character varying(100) NOT NULL,
    content character varying(255) NOT NULL,
    zoom smallint NOT NULL,
    lat numeric(10,6),
    lng numeric(10,6),
    route_planer_title character varying(150),
    route_planer boolean NOT NULL,
    width character varying(6) NOT NULL,
    height character varying(6) NOT NULL,
    info_window boolean NOT NULL,
    scrollwheel boolean NOT NULL,
    double_click_zoom boolean NOT NULL,
    draggable boolean NOT NULL,
    keyboard_shortcuts boolean NOT NULL,
    pan_control boolean NOT NULL,
    zoom_control boolean NOT NULL,
    street_view_control boolean NOT NULL,
    CONSTRAINT djangocms_googlemap_googlemap_zoom_check CHECK ((zoom >= 0))
);


ALTER TABLE public.djangocms_googlemap_googlemap OWNER TO brandon;

--
-- Name: djangocms_inherit_inheritpageplaceholder; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE djangocms_inherit_inheritpageplaceholder (
    cmsplugin_ptr_id integer NOT NULL,
    from_page_id integer,
    from_language character varying(5)
);


ALTER TABLE public.djangocms_inherit_inheritpageplaceholder OWNER TO brandon;

--
-- Name: djangocms_link_link; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE djangocms_link_link (
    cmsplugin_ptr_id integer NOT NULL,
    name character varying(256) NOT NULL,
    url character varying(200),
    page_link_id integer,
    anchor character varying(128) NOT NULL,
    mailto character varying(75),
    phone character varying(40),
    target character varying(100) NOT NULL
);


ALTER TABLE public.djangocms_link_link OWNER TO brandon;

--
-- Name: djangocms_picture_picture; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE djangocms_picture_picture (
    cmsplugin_ptr_id integer NOT NULL,
    image character varying(100) NOT NULL,
    url character varying(255),
    page_link_id integer,
    alt character varying(255),
    longdesc character varying(255),
    "float" character varying(10)
);


ALTER TABLE public.djangocms_picture_picture OWNER TO brandon;

--
-- Name: djangocms_snippet_snippet; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE djangocms_snippet_snippet (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    html text NOT NULL,
    template character varying(50) NOT NULL
);


ALTER TABLE public.djangocms_snippet_snippet OWNER TO brandon;

--
-- Name: djangocms_snippet_snippet_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE djangocms_snippet_snippet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.djangocms_snippet_snippet_id_seq OWNER TO brandon;

--
-- Name: djangocms_snippet_snippet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE djangocms_snippet_snippet_id_seq OWNED BY djangocms_snippet_snippet.id;


--
-- Name: djangocms_snippet_snippetptr; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE djangocms_snippet_snippetptr (
    cmsplugin_ptr_id integer NOT NULL,
    snippet_id integer NOT NULL
);


ALTER TABLE public.djangocms_snippet_snippetptr OWNER TO brandon;

--
-- Name: djangocms_teaser_teaser; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE djangocms_teaser_teaser (
    cmsplugin_ptr_id integer NOT NULL,
    title character varying(255) NOT NULL,
    image character varying(100),
    page_link_id integer,
    url character varying(255),
    description text
);


ALTER TABLE public.djangocms_teaser_teaser OWNER TO brandon;

--
-- Name: djangocms_text_ckeditor_text; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE djangocms_text_ckeditor_text (
    cmsplugin_ptr_id integer NOT NULL,
    body text NOT NULL
);


ALTER TABLE public.djangocms_text_ckeditor_text OWNER TO brandon;

--
-- Name: djangocms_video_video; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE djangocms_video_video (
    cmsplugin_ptr_id integer NOT NULL,
    movie character varying(100),
    movie_url character varying(255),
    image character varying(100),
    width smallint NOT NULL,
    height smallint NOT NULL,
    auto_play boolean NOT NULL,
    auto_hide boolean NOT NULL,
    fullscreen boolean NOT NULL,
    loop boolean NOT NULL,
    bgcolor character varying(6) NOT NULL,
    textcolor character varying(6) NOT NULL,
    seekbarcolor character varying(6) NOT NULL,
    seekbarbgcolor character varying(6) NOT NULL,
    loadingbarcolor character varying(6) NOT NULL,
    buttonoutcolor character varying(6) NOT NULL,
    buttonovercolor character varying(6) NOT NULL,
    buttonhighlightcolor character varying(6) NOT NULL,
    CONSTRAINT djangocms_video_video_height_check CHECK ((height >= 0)),
    CONSTRAINT djangocms_video_video_width_check CHECK ((width >= 0))
);


ALTER TABLE public.djangocms_video_video OWNER TO brandon;

--
-- Name: easy_thumbnails_source; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE easy_thumbnails_source (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL,
    storage_hash character varying(40) NOT NULL
);


ALTER TABLE public.easy_thumbnails_source OWNER TO brandon;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE easy_thumbnails_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_source_id_seq OWNER TO brandon;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE easy_thumbnails_source_id_seq OWNED BY easy_thumbnails_source.id;


--
-- Name: easy_thumbnails_thumbnail; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE easy_thumbnails_thumbnail (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL,
    source_id integer NOT NULL,
    storage_hash character varying(40) NOT NULL
);


ALTER TABLE public.easy_thumbnails_thumbnail OWNER TO brandon;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE easy_thumbnails_thumbnail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_thumbnail_id_seq OWNER TO brandon;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE easy_thumbnails_thumbnail_id_seq OWNED BY easy_thumbnails_thumbnail.id;


--
-- Name: easy_thumbnails_thumbnaildimensions; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE easy_thumbnails_thumbnaildimensions (
    id integer NOT NULL,
    thumbnail_id integer NOT NULL,
    width integer,
    height integer,
    CONSTRAINT easy_thumbnails_thumbnaildimensions_height_check CHECK ((height >= 0)),
    CONSTRAINT easy_thumbnails_thumbnaildimensions_width_check CHECK ((width >= 0))
);


ALTER TABLE public.easy_thumbnails_thumbnaildimensions OWNER TO brandon;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_thumbnaildimensions_id_seq OWNER TO brandon;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq OWNED BY easy_thumbnails_thumbnaildimensions.id;


--
-- Name: menus_cachekey; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE menus_cachekey (
    id integer NOT NULL,
    language character varying(255) NOT NULL,
    site integer NOT NULL,
    key character varying(255) NOT NULL,
    CONSTRAINT menus_cachekey_site_check CHECK ((site >= 0))
);


ALTER TABLE public.menus_cachekey OWNER TO brandon;

--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE menus_cachekey_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menus_cachekey_id_seq OWNER TO brandon;

--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE menus_cachekey_id_seq OWNED BY menus_cachekey.id;


--
-- Name: product_finder_product; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE product_finder_product (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    category_id integer NOT NULL,
    description text,
    slug character varying(50) NOT NULL,
    front_img character varying(100),
    back_img character varying(100),
    ortho_img character varying(100),
    download_file character varying(100)
);


ALTER TABLE public.product_finder_product OWNER TO brandon;

--
-- Name: product_finder_product_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE product_finder_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_finder_product_id_seq OWNER TO brandon;

--
-- Name: product_finder_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE product_finder_product_id_seq OWNED BY product_finder_product.id;


--
-- Name: product_finder_productcategory; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE product_finder_productcategory (
    id integer NOT NULL,
    title character varying(128) NOT NULL,
    slug character varying(50) NOT NULL,
    img character varying(100),
    ordering integer NOT NULL
);


ALTER TABLE public.product_finder_productcategory OWNER TO brandon;

--
-- Name: product_finder_productcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE product_finder_productcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_finder_productcategory_id_seq OWNER TO brandon;

--
-- Name: product_finder_productcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE product_finder_productcategory_id_seq OWNED BY product_finder_productcategory.id;


--
-- Name: reversion_revision; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE reversion_revision (
    id integer NOT NULL,
    manager_slug character varying(200) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    user_id integer,
    comment text NOT NULL
);


ALTER TABLE public.reversion_revision OWNER TO brandon;

--
-- Name: reversion_revision_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE reversion_revision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reversion_revision_id_seq OWNER TO brandon;

--
-- Name: reversion_revision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE reversion_revision_id_seq OWNED BY reversion_revision.id;


--
-- Name: reversion_version; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE reversion_version (
    id integer NOT NULL,
    revision_id integer NOT NULL,
    object_id text NOT NULL,
    object_id_int integer,
    content_type_id integer NOT NULL,
    format character varying(255) NOT NULL,
    serialized_data text NOT NULL,
    object_repr text NOT NULL
);


ALTER TABLE public.reversion_version OWNER TO brandon;

--
-- Name: reversion_version_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE reversion_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reversion_version_id_seq OWNER TO brandon;

--
-- Name: reversion_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE reversion_version_id_seq OWNED BY reversion_version.id;


--
-- Name: south_migrationhistory; Type: TABLE; Schema: public; Owner: brandon; Tablespace: 
--

CREATE TABLE south_migrationhistory (
    id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    migration character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.south_migrationhistory OWNER TO brandon;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: brandon
--

CREATE SEQUENCE south_migrationhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.south_migrationhistory_id_seq OWNER TO brandon;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brandon
--

ALTER SEQUENCE south_migrationhistory_id_seq OWNED BY south_migrationhistory.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_cmsplugin ALTER COLUMN id SET DEFAULT nextval('cms_cmsplugin_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_globalpagepermission ALTER COLUMN id SET DEFAULT nextval('cms_globalpagepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_globalpagepermission_sites ALTER COLUMN id SET DEFAULT nextval('cms_globalpagepermission_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_page ALTER COLUMN id SET DEFAULT nextval('cms_page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_page_placeholders ALTER COLUMN id SET DEFAULT nextval('cms_page_placeholders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_pagepermission ALTER COLUMN id SET DEFAULT nextval('cms_pagepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_placeholder ALTER COLUMN id SET DEFAULT nextval('cms_placeholder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_staticplaceholder ALTER COLUMN id SET DEFAULT nextval('cms_staticplaceholder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_title ALTER COLUMN id SET DEFAULT nextval('cms_title_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_usersettings ALTER COLUMN id SET DEFAULT nextval('cms_usersettings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cmsplugin_file_gallery_downloadablefile ALTER COLUMN id SET DEFAULT nextval('cmsplugin_file_gallery_downloadablefile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cmsplugin_gallery_image ALTER COLUMN id SET DEFAULT nextval('cmsplugin_gallery_image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cmsplugin_image_gallery_galleryimage ALTER COLUMN id SET DEFAULT nextval('cmsplugin_image_gallery_galleryimage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY djangocms_snippet_snippet ALTER COLUMN id SET DEFAULT nextval('djangocms_snippet_snippet_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY easy_thumbnails_source ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_source_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY easy_thumbnails_thumbnail ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnail_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnaildimensions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY menus_cachekey ALTER COLUMN id SET DEFAULT nextval('menus_cachekey_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY product_finder_product ALTER COLUMN id SET DEFAULT nextval('product_finder_product_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY product_finder_productcategory ALTER COLUMN id SET DEFAULT nextval('product_finder_productcategory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY reversion_revision ALTER COLUMN id SET DEFAULT nextval('reversion_revision_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY reversion_version ALTER COLUMN id SET DEFAULT nextval('reversion_version_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY south_migrationhistory ALTER COLUMN id SET DEFAULT nextval('south_migrationhistory_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add site	7	add_site
20	Can change site	7	change_site
21	Can delete site	7	delete_site
22	Can add user setting	8	add_usersettings
23	Can change user setting	8	change_usersettings
24	Can delete user setting	8	delete_usersettings
25	Can add placeholder	9	add_placeholder
26	Can change placeholder	9	change_placeholder
27	Can delete placeholder	9	delete_placeholder
28	Can add cms plugin	10	add_cmsplugin
29	Can change cms plugin	10	change_cmsplugin
30	Can delete cms plugin	10	delete_cmsplugin
31	Can add page	11	add_page
32	Can change page	11	change_page
33	Can delete page	11	delete_page
34	Can view page	11	view_page
35	Can publish page	11	publish_page
36	Can edit static placeholders	11	edit_static_placeholder
37	Can add Page global permission	12	add_globalpagepermission
38	Can change Page global permission	12	change_globalpagepermission
39	Can delete Page global permission	12	delete_globalpagepermission
40	Can add Page permission	13	add_pagepermission
41	Can change Page permission	13	change_pagepermission
42	Can delete Page permission	13	delete_pagepermission
43	Can add User (page)	14	add_pageuser
44	Can change User (page)	14	change_pageuser
45	Can delete User (page)	14	delete_pageuser
46	Can add User group (page)	15	add_pageusergroup
47	Can change User group (page)	15	change_pageusergroup
48	Can delete User group (page)	15	delete_pageusergroup
49	Can add title	16	add_title
50	Can change title	16	change_title
51	Can delete title	16	delete_title
52	Can add placeholder reference	17	add_placeholderreference
53	Can change placeholder reference	17	change_placeholderreference
54	Can delete placeholder reference	17	delete_placeholderreference
55	Can add static placeholder	18	add_staticplaceholder
56	Can change static placeholder	18	change_staticplaceholder
57	Can delete static placeholder	18	delete_staticplaceholder
58	Can add alias plugin model	19	add_aliaspluginmodel
59	Can change alias plugin model	19	change_aliaspluginmodel
60	Can delete alias plugin model	19	delete_aliaspluginmodel
61	Can add cache key	20	add_cachekey
62	Can change cache key	20	change_cachekey
63	Can delete cache key	20	delete_cachekey
64	Can add migration history	21	add_migrationhistory
65	Can change migration history	21	change_migrationhistory
66	Can delete migration history	21	delete_migrationhistory
67	Can add file	22	add_file
68	Can change file	22	change_file
69	Can delete file	22	delete_file
70	Can add google map	23	add_googlemap
71	Can change google map	23	change_googlemap
72	Can delete google map	23	delete_googlemap
73	Can add inherit page placeholder	24	add_inheritpageplaceholder
74	Can change inherit page placeholder	24	change_inheritpageplaceholder
75	Can delete inherit page placeholder	24	delete_inheritpageplaceholder
76	Can add picture	25	add_picture
77	Can change picture	25	change_picture
78	Can delete picture	25	delete_picture
79	Can add teaser	26	add_teaser
80	Can change teaser	26	change_teaser
81	Can delete teaser	26	delete_teaser
82	Can add video	27	add_video
83	Can change video	27	change_video
84	Can delete video	27	delete_video
85	Can add link	28	add_link
86	Can change link	28	change_link
87	Can delete link	28	delete_link
88	Can add Snippet	29	add_snippet
89	Can change Snippet	29	change_snippet
90	Can delete Snippet	29	delete_snippet
91	Can add Snippet	30	add_snippetptr
92	Can change Snippet	30	change_snippetptr
93	Can delete Snippet	30	delete_snippetptr
94	Can add text	31	add_text
95	Can change text	31	change_text
96	Can delete text	31	delete_text
97	Can add revision	32	add_revision
98	Can change revision	32	change_revision
99	Can delete revision	32	delete_revision
100	Can add version	33	add_version
101	Can change version	33	change_version
102	Can delete version	33	delete_version
103	Can add gallery plugin	34	add_galleryplugin
104	Can change gallery plugin	34	change_galleryplugin
105	Can delete gallery plugin	34	delete_galleryplugin
106	Can add image	35	add_image
107	Can change image	35	change_image
108	Can delete image	35	delete_image
109	Can add source	36	add_source
110	Can change source	36	change_source
111	Can delete source	36	delete_source
112	Can add thumbnail	37	add_thumbnail
113	Can change thumbnail	37	change_thumbnail
114	Can delete thumbnail	37	delete_thumbnail
115	Can add thumbnail dimensions	38	add_thumbnaildimensions
116	Can change thumbnail dimensions	38	change_thumbnaildimensions
117	Can delete thumbnail dimensions	38	delete_thumbnaildimensions
118	Can add contact	39	add_contact
119	Can change contact	39	change_contact
120	Can delete contact	39	delete_contact
121	Can add custom contact	40	add_customcontact
122	Can change custom contact	40	change_customcontact
123	Can delete custom contact	40	delete_customcontact
124	Can add search plugin config	41	add_searchpluginconfig
125	Can change search plugin config	41	change_searchpluginconfig
126	Can delete search plugin config	41	delete_searchpluginconfig
127	Can add file gallery plugin	42	add_filegalleryplugin
128	Can change file gallery plugin	42	change_filegalleryplugin
129	Can delete file gallery plugin	42	delete_filegalleryplugin
130	Can add downloadable file	43	add_downloadablefile
131	Can change downloadable file	43	change_downloadablefile
132	Can delete downloadable file	43	delete_downloadablefile
133	Can add product category	44	add_productcategory
134	Can change product category	44	change_productcategory
135	Can delete product category	44	delete_productcategory
136	Can add product	45	add_product
137	Can change product	45	change_product
138	Can delete product	45	delete_product
139	Can add guardiant contact	46	add_guardiantcontact
140	Can change guardiant contact	46	change_guardiantcontact
141	Can delete guardiant contact	46	delete_guardiantcontact
142	Can add image gallery plugin	47	add_imagegalleryplugin
143	Can change image gallery plugin	47	change_imagegalleryplugin
144	Can delete image gallery plugin	47	delete_imagegalleryplugin
145	Can add gallery image	48	add_galleryimage
146	Can change gallery image	48	change_galleryimage
147	Can delete gallery image	48	delete_galleryimage
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('auth_permission_id_seq', 147, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$12000$mFV9Smpl6Cgi$uUo73fG93RWPRvmkNVS+lO5f0+XqTAbBYpqXQ/SpcSQ=	2014-09-23 17:57:29.317687-04	t	brandon			blorenz@gmail.com	t	t	2014-09-01 20:12:46.417081-04
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: cms_aliaspluginmodel; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY cms_aliaspluginmodel (cmsplugin_ptr_id, plugin_id, alias_placeholder_id) FROM stdin;
\.


--
-- Data for Name: cms_cmsplugin; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY cms_cmsplugin (id, placeholder_id, parent_id, "position", language, plugin_type, creation_date, changed_date, level, lft, rght, tree_id) FROM stdin;
4	7	\N	0	en	TextPlugin	2014-09-14 15:30:44.332914-04	2014-09-14 15:30:52.388849-04	0	1	2	2
86	32	85	0	en	PicturePlugin	2014-09-14 18:38:15.230274-04	2014-09-14 18:38:31.174218-04	1	2	3	41
167	32	\N	2	en	ContactPlugin	2014-09-20 22:34:43.957713-04	2014-09-20 22:34:57.255086-04	0	1	2	51
30	34	29	0	en	PicturePlugin	2014-09-14 16:34:22.410402-04	2014-09-14 16:43:17.344783-04	1	2	3	17
85	32	\N	0	en	TextPlugin	2014-09-14 18:38:10.897009-04	2014-09-14 18:38:31.215525-04	0	1	4	41
57	1	\N	\N	en	PlaceholderPlugin	2014-09-14 17:03:54.128915-04	2014-09-14 17:03:54.142211-04	0	1	2	31
8	9	\N	0	en	TextPlugin	2014-09-14 15:48:23.267426-04	2014-09-14 15:48:42.335743-04	0	1	2	5
87	41	\N	1	en	ContactPlugin	2014-09-14 16:09:59.740713-04	2014-09-14 18:38:36.262189-04	0	1	2	42
37	34	\N	1	en	TextPlugin	2014-09-14 15:30:44.332914-04	2014-09-14 17:04:19.615959-04	0	1	2	21
12	11	11	0	en	LinkPlugin	2014-09-14 15:58:57.858449-04	2014-09-14 15:59:14.136295-04	1	2	3	6
13	11	11	1	en	LinkPlugin	2014-09-14 15:59:18.874261-04	2014-09-14 15:59:29.618508-04	1	4	5	6
11	11	\N	0	en	TextPlugin	2014-09-14 15:51:07.209564-04	2014-09-14 15:59:31.307785-04	0	1	6	6
38	34	\N	2	en	TextPlugin	2014-09-14 16:47:30.733327-04	2014-09-14 17:04:19.629743-04	0	1	4	22
50	34	\N	3	en	TextPlugin	2014-09-14 15:30:44.332914-04	2014-09-14 17:04:19.642206-04	0	1	2	26
15	18	14	0	en	PicturePlugin	2014-09-14 16:05:20.070195-04	2014-09-14 16:06:11.32716-04	1	2	3	7
14	18	\N	0	en	TextPlugin	2014-09-14 16:04:34.300168-04	2014-09-14 16:06:13.191051-04	0	1	4	7
151	20	150	0	en	PicturePlugin	2014-09-14 16:05:20.070195-04	2014-09-20 17:33:47.761088-04	1	2	3	49
170	6	\N	0	en	CMSImageGalleryPlugin	2014-09-23 18:08:51.819468-04	2014-09-23 18:08:51.825166-04	0	1	2	52
150	20	\N	0	en	TextPlugin	2014-09-14 16:04:34.300168-04	2014-09-20 17:33:47.810548-04	0	1	4	49
152	20	\N	2	en	TextPlugin	2014-09-20 17:28:43.59833-04	2014-09-20 17:33:47.83209-04	0	1	2	50
90	41	89	0	en	PicturePlugin	2014-09-14 18:38:15.230274-04	2014-09-14 18:38:36.338554-04	1	2	3	44
59	38	58	0	en	LinkPlugin	2014-09-14 15:58:57.858449-04	2014-09-14 17:03:54.246305-04	1	2	3	32
89	41	\N	0	en	TextPlugin	2014-09-14 18:38:10.897009-04	2014-09-14 18:38:36.376863-04	0	1	4	44
145	15	\N	0	en	TextPlugin	2014-09-14 15:48:23.267426-04	2014-09-20 17:23:04.160018-04	0	1	2	46
74	36	73	0	en	PicturePlugin	2014-09-14 16:34:22.410402-04	2014-09-14 17:05:53.809865-04	1	2	3	34
83	39	82	0	en	PicturePlugin	2014-09-14 17:13:42.824523-04	2014-09-14 17:13:52.945387-04	1	2	3	39
39	34	38	0	en	PicturePlugin	2014-09-14 16:47:36.482984-04	2014-09-14 16:47:45.231146-04	1	2	3	22
60	38	58	1	en	LinkPlugin	2014-09-14 15:59:18.874261-04	2014-09-14 17:03:54.270993-04	1	4	5	32
58	38	\N	0	en	TextPlugin	2014-09-14 15:51:07.209564-04	2014-09-14 17:03:54.328472-04	0	1	6	32
147	17	146	0	en	LinkPlugin	2014-09-14 15:58:57.858449-04	2014-09-20 17:23:04.202367-04	1	2	3	47
82	39	\N	0	en	TextPlugin	2014-09-14 17:13:37.902519-04	2014-09-14 17:13:54.470517-04	0	1	4	39
62	34	61	0	en	LinkPlugin	2014-09-14 15:58:57.858449-04	2014-09-14 17:04:19.564968-04	1	2	3	33
63	34	61	1	en	LinkPlugin	2014-09-14 15:59:18.874261-04	2014-09-14 17:04:19.578201-04	1	4	5	33
29	34	\N	0	en	TextPlugin	2014-09-14 16:34:15.847911-04	2014-09-14 17:04:19.593149-04	0	1	4	17
144	13	\N	0	en	TextPlugin	2014-09-14 15:30:44.332914-04	2014-09-20 17:23:04.114057-04	0	1	2	45
148	17	146	1	en	LinkPlugin	2014-09-14 15:59:18.874261-04	2014-09-20 17:23:04.218613-04	1	4	5	47
146	17	\N	0	en	TextPlugin	2014-09-14 15:51:07.209564-04	2014-09-20 17:23:04.247825-04	0	1	6	47
149	18	\N	2	en	TextPlugin	2014-09-20 17:28:43.59833-04	2014-09-20 17:31:01.696782-04	0	1	2	48
84	39	\N	2	en	GuardiantSearchPlugin	2014-09-14 17:29:18.022734-04	2014-09-14 17:42:01.556163-04	0	1	2	40
61	34	\N	4	en	TextPlugin	2014-09-14 15:51:07.209564-04	2014-09-14 17:05:41.238296-04	0	1	6	33
77	36	76	0	en	PicturePlugin	2014-09-14 16:47:36.482984-04	2014-09-14 17:05:53.91523-04	1	2	3	36
80	36	79	0	en	LinkPlugin	2014-09-14 15:58:57.858449-04	2014-09-14 17:05:54.034473-04	1	2	3	38
81	36	79	1	en	LinkPlugin	2014-09-14 15:59:18.874261-04	2014-09-14 17:05:54.079925-04	1	4	5	38
73	36	\N	0	en	TextPlugin	2014-09-14 16:34:15.847911-04	2014-09-14 17:05:54.131723-04	0	1	4	34
75	36	\N	1	en	TextPlugin	2014-09-14 15:30:44.332914-04	2014-09-14 17:05:54.19168-04	0	1	2	35
76	36	\N	2	en	TextPlugin	2014-09-14 16:47:30.733327-04	2014-09-14 17:05:54.234364-04	0	1	4	36
78	36	\N	3	en	TextPlugin	2014-09-14 15:30:44.332914-04	2014-09-14 17:05:54.305926-04	0	1	2	37
79	36	\N	4	en	TextPlugin	2014-09-14 15:51:07.209564-04	2014-09-14 17:05:54.391309-04	0	1	6	38
\.


--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('cms_cmsplugin_id_seq', 170, true);


--
-- Data for Name: cms_globalpagepermission; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY cms_globalpagepermission (id, user_id, group_id, can_change, can_add, can_delete, can_change_advanced_settings, can_publish, can_change_permissions, can_move_page, can_view, can_recover_page) FROM stdin;
\.


--
-- Name: cms_globalpagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('cms_globalpagepermission_id_seq', 1, false);


--
-- Data for Name: cms_globalpagepermission_sites; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY cms_globalpagepermission_sites (id, globalpagepermission_id, site_id) FROM stdin;
\.


--
-- Name: cms_globalpagepermission_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('cms_globalpagepermission_sites_id_seq', 1, false);


--
-- Data for Name: cms_page; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY cms_page (id, created_by, changed_by, parent_id, creation_date, changed_date, publication_date, publication_end_date, in_navigation, soft_root, reverse_id, navigation_extenders, template, site_id, login_required, limit_visibility_in_menu, is_home, application_urls, application_namespace, level, lft, rght, tree_id, publisher_is_draft, publisher_public_id, languages, revision_id, xframe_options) FROM stdin;
1	brandon	brandon	\N	2014-09-01 20:20:41.259196-04	2014-09-23 18:08:51.907421-04	2014-09-01 20:20:41.416-04	\N	t	f	\N		homepage.html	1	f	\N	t		\N	0	1	2	1	t	2	en	0	0
6	brandon	brandon	\N	2014-09-07 21:35:10.400809-04	2014-09-07 21:35:10.728028-04	2014-09-07 21:35:10.386482-04	\N	t	f	\N	\N	products.html	1	f	\N	f	\N	\N	0	1	2	6	f	5	en	0	0
4	brandon	brandon	\N	2014-09-07 19:09:52.079745-04	2014-09-20 17:33:47.844561-04	2014-09-07 19:09:52.067022-04	\N	f	f	\N	\N	template_1.html	1	f	\N	f	\N	\N	0	1	2	4	f	3	en	0	0
2	brandon	brandon	\N	2014-09-01 20:20:41.42559-04	2014-09-20 17:33:47.865697-04	2014-09-01 20:20:41.416-04	\N	t	f	\N		homepage.html	1	f	\N	t		\N	0	1	2	3	f	1	en	0	0
5	brandon	brandon	\N	2014-09-07 21:25:48.188485-04	2014-09-07 21:36:49.672221-04	2014-09-07 21:35:10.386482-04	\N	t	f	\N	\N	products.html	1	f	\N	f	\N	\N	0	1	2	5	t	6	en	0	0
3	brandon	brandon	\N	2014-09-07 19:09:31.722159-04	2014-09-20 17:33:47.983472-04	2014-09-07 19:09:52.067022-04	\N	f	f	\N	\N	template_1.html	1	f	\N	f	\N	\N	0	1	2	2	t	4	en	0	0
8	brandon	brandon	\N	2014-09-14 16:34:02.734159-04	2014-09-14 17:05:54.815692-04	2014-09-14 16:35:41.0207-04	\N	t	f	\N	\N	INHERIT	1	f	\N	f	\N	\N	0	1	2	9	t	9	en	0	0
10	brandon	brandon	\N	2014-09-14 17:13:18.011955-04	2014-09-14 17:42:01.718076-04	\N	\N	t	f	\N	\N	INHERIT	1	f	\N	f	\N	\N	0	1	2	11	t	\N	en	0	0
9	brandon	brandon	\N	2014-09-14 16:35:41.090085-04	2014-09-14 17:05:54.419078-04	2014-09-14 16:35:41.0207-04	\N	t	f	\N	\N	INHERIT	1	f	\N	f	\N	\N	0	1	2	10	f	8	en	0	0
7	brandon	brandon	\N	2014-09-14 14:50:32.945704-04	2014-09-20 22:34:57.34947-04	2014-09-14 18:38:35.974867-04	\N	t	f	\N	\N	INHERIT	1	f	\N	f	\N	\N	0	1	2	7	t	11	en	0	0
11	brandon	brandon	\N	2014-09-14 18:38:36.005386-04	2014-09-14 18:38:36.391008-04	2014-09-14 18:38:35.974867-04	\N	t	f	\N	\N	INHERIT	1	f	\N	f	\N	\N	0	1	2	8	f	7	en	0	0
\.


--
-- Name: cms_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('cms_page_id_seq', 11, true);


--
-- Data for Name: cms_page_placeholders; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY cms_page_placeholders (id, page_id, placeholder_id) FROM stdin;
1	1	2
2	1	3
3	2	4
4	2	5
5	1	6
6	1	7
7	1	8
8	1	9
9	1	10
10	1	11
11	2	12
12	2	13
13	2	14
14	2	15
15	2	16
16	2	17
17	3	18
18	3	19
19	4	20
20	4	21
21	5	24
22	5	25
23	5	26
24	5	27
25	6	28
26	6	29
27	6	30
28	6	31
29	7	32
30	7	33
31	8	34
32	8	35
33	9	36
34	9	37
35	10	39
36	10	40
37	11	41
38	11	42
\.


--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('cms_page_placeholders_id_seq', 38, true);


--
-- Data for Name: cms_pagepermission; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY cms_pagepermission (id, user_id, group_id, can_change, can_add, can_delete, can_change_advanced_settings, can_publish, can_change_permissions, can_move_page, can_view, grant_on, page_id) FROM stdin;
\.


--
-- Name: cms_pagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('cms_pagepermission_id_seq', 1, false);


--
-- Data for Name: cms_pageuser; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY cms_pageuser (user_ptr_id, created_by_id) FROM stdin;
\.


--
-- Data for Name: cms_pageusergroup; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY cms_pageusergroup (group_ptr_id, created_by_id) FROM stdin;
\.


--
-- Data for Name: cms_placeholder; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY cms_placeholder (id, slot, default_width) FROM stdin;
1	clipboard	\N
2	template_1_content	\N
3	base_content	\N
4	template_1_content	\N
5	base_content	\N
6	slideshow_content	\N
7	mission_content	\N
8	quote_content	\N
9	creto_content	\N
10	grid_content	\N
11	help_content	\N
12	slideshow_content	\N
13	mission_content	\N
14	quote_content	\N
15	creto_content	\N
16	grid_content	\N
17	help_content	\N
18	template_1_content	\N
19	base_content	\N
20	template_1_content	\N
21	base_content	\N
24	template_1_content	\N
25	base_content	\N
26	general	\N
27	products	\N
28	general	\N
29	products	\N
30	base_content	\N
31	template_1_content	\N
32	template_1_content	\N
33	base_content	\N
34	template_1_content	\N
35	base_content	\N
36	template_1_content	\N
37	base_content	\N
38	clipboard	\N
39	template_1_content	\N
40	base_content	\N
41	template_1_content	\N
42	base_content	\N
\.


--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('cms_placeholder_id_seq', 42, true);


--
-- Data for Name: cms_placeholderreference; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY cms_placeholderreference (cmsplugin_ptr_id, name, placeholder_ref_id) FROM stdin;
57	Help_Content	38
\.


--
-- Data for Name: cms_staticplaceholder; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY cms_staticplaceholder (id, name, code, draft_id, public_id, dirty, creation_method, site_id) FROM stdin;
\.


--
-- Name: cms_staticplaceholder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('cms_staticplaceholder_id_seq', 1, false);


--
-- Data for Name: cms_title; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY cms_title (id, language, title, page_title, menu_title, meta_description, slug, path, has_url_overwrite, redirect, page_id, creation_date, published, publisher_is_draft, publisher_public_id, publisher_state) FROM stdin;
9	en	Services				services	services	f	\N	9	2014-09-14 16:34:02.850073-04	t	f	8	1
3	en	About Us				about-us	about-us	f	\N	3	2014-09-07 19:09:31.805119-04	t	t	4	0
4	en	About Us				about-us	about-us	f	\N	4	2014-09-07 19:09:31.805119-04	t	f	3	1
10	en	Distributors				distributors	distributors	f	\N	10	2014-09-14 17:13:18.112763-04	f	t	\N	1
7	en	Contact Us				contact-us	contact-us	f	\N	7	2014-09-14 14:50:33.093574-04	t	t	11	1
11	en	Contact Us				contact-us	contact-us	f	\N	11	2014-09-14 14:50:33.093574-04	t	f	7	1
6	en	Products		Products		products	products	f	\N	6	2014-09-07 21:25:48.269492-04	t	f	5	1
5	en	Products		Products		products	products	f	\N	5	2014-09-07 21:25:48.269492-04	t	t	6	1
8	en	Services				services	services	f	\N	8	2014-09-14 16:34:02.850073-04	t	t	9	0
2	en	Home				home		f		2	2014-09-01 20:20:41.372182-04	t	f	1	1
1	en	Home				home		f		1	2014-09-01 20:20:41.372182-04	t	t	2	1
\.


--
-- Name: cms_title_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('cms_title_id_seq', 11, true);


--
-- Data for Name: cms_usersettings; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY cms_usersettings (id, user_id, language, clipboard_id) FROM stdin;
1	1	en	1
\.


--
-- Name: cms_usersettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('cms_usersettings_id_seq', 1, true);


--
-- Data for Name: cmsplugin_contact_contact; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY cmsplugin_contact_contact (cmsplugin_ptr_id, site_email, thanks, submit, spam_protection_method, akismet_api_key, recaptcha_public_key, recaptcha_private_key, recaptcha_theme, form_name, form_layout, redirect_url) FROM stdin;
87	fdsfd@sdfds.com		Submit	0				clean	dsfdf	cmsplugin_contact.forms.ContactForm	
167	blorenz@gmail.com		Submit	0				clean	sdfsdf	guardiant.forms.GuardiantContactForm	
\.


--
-- Data for Name: cmsplugin_file_gallery_downloadablefile; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY cmsplugin_file_gallery_downloadablefile (id, inline_ordering_position, gallery_id, src, src_height, src_width, title, alt, link, extended_content, author, subtitle, downloadable_file) FROM stdin;
\.


--
-- Name: cmsplugin_file_gallery_downloadablefile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('cmsplugin_file_gallery_downloadablefile_id_seq', 1, false);


--
-- Data for Name: cmsplugin_file_gallery_filegalleryplugin; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY cmsplugin_file_gallery_filegalleryplugin (cmsplugin_ptr_id, title, template) FROM stdin;
\.


--
-- Data for Name: cmsplugin_gallery_galleryplugin; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY cmsplugin_gallery_galleryplugin (cmsplugin_ptr_id, title, slide_duration, fade_duration, template) FROM stdin;
\.


--
-- Data for Name: cmsplugin_gallery_image; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY cmsplugin_gallery_image (id, inline_ordering_position, gallery_id, src, src_height, src_width, title, alt, link, extended_content) FROM stdin;
7	4	9	cms_page_media/1/invisible_1.png	1	1	Support		/support	<p>something about support</p>
8	5	9	cms_page_media/1/invisible_2.png	1	1	Distributors		/distributors	<p>Something about distributors</p>
9	6	9	cms_page_media/1/invisible_3.png	1	1	Training		/training	<p>something about training</p>
10	7	9	cms_page_media/1/invisible_4.png	1	1	What's New		/whats-new	<p>Something about what's new</p>
6	3	9	cms_page_media/1/invisible.png	1	1	Spare Parts		/spare-parts	<p>Something about spare parts.Something about spare parts.Something about spare parts.Something about spare parts.Something about spare parts.Something about spare parts.Something about spare parts.Something about spare parts.Something about spare parts.</p>
32	8	42	cms_page_media/1/shelf-image.png	536	960	Now Shipping Replacement Parts			<p>Full stock of OEM and direct replacement parts</p>\r\n<p>Guardiant ships orders same day from our huge onsite inventory. We know how important it is to get your part as fast as possible and you can count on us to help get you back online.</p>
33	9	44	cms_page_media/1/quote-bg.png	388	960	RICK SHOOP, PHOTOGROUP INC.			<p>Guardiant was just great to work with. They helped analyse our immediate problems and got us running. They were then there to guide us through the process of upgrading our lube systems.</p>
34	10	46	cms_page_media/1/invisible.png	1	1	Spare Parts		/spare-parts	<p>Something about spare parts.Something about spare parts.Something about spare parts.Something about spare parts.Something about spare parts.Something about spare parts.Something about spare parts.Something about spare parts.Something about spare parts.</p>
35	11	46	cms_page_media/1/invisible_1.png	1	1	Support		/support	<p>something about support</p>
36	12	46	cms_page_media/1/invisible_2.png	1	1	Distributors		/distributors	<p>Something about distributors</p>
37	13	46	cms_page_media/1/invisible_3.png	1	1	Training		/training	<p>something about training</p>
38	14	46	cms_page_media/1/invisible_4.png	1	1	What's New		/whats-new	<p>Something about what's new</p>
39	15	18	cms_page_media/1/shelf-image.png	536	960	Now Shipping Replacement Parts			<p>Full stock of OEM and direct replacement parts</p>\r\n<p>Guardiant ships orders same day from our huge onsite inventory. We know how important it is to get your part as fast as possible and you can count on us to help get you back online.</p>
40	16	20	cms_page_media/1/quote-bg.png	388	960	RICK SHOOP, PHOTOGROUP INC.			<p>Guardiant was just great to work with. They helped analyse our immediate problems and got us running. They were then there to guide us through the process of upgrading our lube systems.</p>
41	17	22	cms_page_media/1/invisible.png	1	1	Spare Parts		/spare-parts	<p>Something about spare parts.Something about spare parts.Something about spare parts.Something about spare parts.Something about spare parts.Something about spare parts.Something about spare parts.Something about spare parts.Something about spare parts.</p>
42	18	22	cms_page_media/1/invisible_1.png	1	1	Support		/support	<p>something about support</p>
43	19	22	cms_page_media/1/invisible_2.png	1	1	Distributors		/distributors	<p>Something about distributors</p>
44	20	22	cms_page_media/1/invisible_3.png	1	1	Training		/training	<p>something about training</p>
45	21	22	cms_page_media/1/invisible_4.png	1	1	What's New		/whats-new	<p>Something about what's new</p>
\.


--
-- Name: cmsplugin_gallery_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('cmsplugin_gallery_image_id_seq', 104, true);


--
-- Data for Name: cmsplugin_galleryplugin; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY cmsplugin_galleryplugin (cmsplugin_ptr_id, template, title, slide_duration, fade_duration) FROM stdin;
7	cmsplugin_gallery/quote_gallery.html	Quote Gallery	3	1
9	cmsplugin_gallery/grid_gallery.html	Grid Gallery	3	1
42	cmsplugin_gallery/homepage_gallery.html	Home page Gallery	3	1
44	cmsplugin_gallery/quote_gallery.html	Quote Gallery	3	1
46	cmsplugin_gallery/grid_gallery.html	Grid Gallery	3	1
1	cmsplugin_gallery/homepage_gallery.html	Home page Gallery	3	1
18	cmsplugin_gallery/homepage_gallery.html	Home page Gallery	3	1
20	cmsplugin_gallery/quote_gallery.html	Quote Gallery	3	1
22	cmsplugin_gallery/grid_gallery.html	Grid Gallery	3	1
\.


--
-- Data for Name: cmsplugin_image_gallery_galleryimage; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY cmsplugin_image_gallery_galleryimage (id, inline_ordering_position, gallery_id, src, src_height, src_width, title, alt, link, extended_content) FROM stdin;
\.


--
-- Name: cmsplugin_image_gallery_galleryimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('cmsplugin_image_gallery_galleryimage_id_seq', 2, true);


--
-- Data for Name: cmsplugin_image_gallery_imagegalleryplugin; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY cmsplugin_image_gallery_imagegalleryplugin (cmsplugin_ptr_id, title, slide_duration, fade_duration, template) FROM stdin;
\.


--
-- Data for Name: cmsplugin_search_searchpluginconfig; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY cmsplugin_search_searchpluginconfig (cmsplugin_ptr_id, search_identifier, template) FROM stdin;
84	Some _sweet_id	cmsplugin_search/distributors.html
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2014-09-01 20:18:15.570727-04	1	7	1	guardiant.com	2	Changed domain and name.
2	2014-09-01 20:20:41.588008-04	1	11	1	Home	1	
3	2014-09-01 20:22:29.870891-04	1	11	1	Home	2	Changed xframe_options.
4	2014-09-01 20:22:42.48159-04	1	11	1	Home	2	
5	2014-09-01 21:01:32.637315-04	1	11	1	Home	2	Changed template and xframe_options.
6	2014-09-06 22:36:18.459877-04	1	11	1	Home	2	
7	2014-09-06 22:54:56.212866-04	1	11	1	Home	2	
8	2014-09-06 23:16:06.918665-04	1	11	1	Home	2	
9	2014-09-07 15:59:39.712075-04	1	11	1	Home	2	
10	2014-09-07 16:14:33.65873-04	1	11	1	Home	2	
11	2014-09-07 16:15:26.644883-04	1	11	1	Home	2	
12	2014-09-07 19:09:15.315642-04	1	11	1	Home	2	
13	2014-09-07 19:09:31.843255-04	1	11	3	About Us	1	
14	2014-09-07 19:09:52.27153-04	1	11	3	About Us	2	
15	2014-09-07 19:13:22.698616-04	1	11	51	51	3	
16	2014-09-07 19:15:12.172471-04	1	11	3	About Us	2	
17	2014-09-07 19:38:07.961998-04	1	11	3	About Us	2	
18	2014-09-07 19:38:21.25667-04	1	11	1	clipboard	3	
19	2014-09-07 19:38:57.39358-04	1	11	1	clipboard	3	
20	2014-09-07 19:39:53.272704-04	1	11	3	About Us	2	
21	2014-09-07 19:45:22.438256-04	1	11	1	clipboard	3	
22	2014-09-07 19:46:00.857312-04	1	11	1	clipboard	3	
23	2014-09-07 19:46:42.99351-04	1	11	1	clipboard	3	
24	2014-09-07 19:51:43.361432-04	1	9	1	clipboard	3	
25	2014-09-07 19:51:51.129781-04	1	9	1	clipboard	3	
26	2014-09-07 19:55:17.140483-04	1	9	1	clipboard	3	
27	2014-09-07 20:02:52.794293-04	1	11	96	96	3	
28	2014-09-07 21:25:48.317268-04	1	11	5	Products	1	
29	2014-09-07 21:28:51.830631-04	1	11	1	clipboard	3	
30	2014-09-07 21:32:54.142327-04	1	11	1	clipboard	3	
31	2014-09-07 21:35:10.79247-04	1	11	5	Products	2	
32	2014-09-14 14:50:33.181343-04	1	11	7	Contact Us	1	
33	2014-09-14 15:27:18.059966-04	1	11	2	2	3	
34	2014-09-14 15:29:50.979568-04	1	11	3	3	3	
35	2014-09-14 15:34:48.808116-04	1	11	5	5	3	
36	2014-09-14 16:06:44.396591-04	1	11	3	About Us	2	
37	2014-09-14 16:06:53.093087-04	1	11	1	Home	2	
38	2014-09-14 16:34:02.899199-04	1	11	8	Services	1	
39	2014-09-14 16:35:42.392953-04	1	11	8	Services	2	
40	2014-09-14 16:43:34.497866-04	1	11	8	Services	2	
41	2014-09-14 16:44:31.021864-04	1	11	1	clipboard	3	
42	2014-09-14 16:45:08.731543-04	1	11	35	35	3	
43	2014-09-14 16:48:21.34419-04	1	11	8	Services	2	
44	2014-09-14 16:49:37.85054-04	1	11	8	Services	2	
45	2014-09-14 17:00:17.085124-04	1	11	8	Services	2	
46	2014-09-14 17:03:53.912032-04	1	11	1	clipboard	3	
47	2014-09-14 17:04:22.934374-04	1	11	8	Services	2	
48	2014-09-14 17:05:54.621624-04	1	11	8	Services	2	
49	2014-09-14 17:13:18.168655-04	1	11	10	Distributors	1	
50	2014-09-14 18:38:36.539859-04	1	11	7	Contact Us	2	
51	2014-09-14 20:30:37.65076-04	1	44	1	ProductCategory object	1	
52	2014-09-14 20:31:03.663228-04	1	44	2	ProductCategory object	1	
53	2014-09-14 20:31:19.935431-04	1	44	3	ProductCategory object	1	
54	2014-09-14 20:31:38.4811-04	1	44	4	ProductCategory object	1	
55	2014-09-14 20:31:57.022994-04	1	44	5	ProductCategory object	1	
56	2014-09-14 20:32:13.254668-04	1	44	6	ProductCategory object	1	
57	2014-09-14 20:32:25.530738-04	1	44	7	ProductCategory object	1	
58	2014-09-14 20:32:44.941685-04	1	44	8	ProductCategory object	1	
59	2014-09-14 20:33:04.025934-04	1	44	9	ProductCategory object	1	
60	2014-09-14 20:43:04.003646-04	1	45	1	Ariel Premier 2000	1	
61	2014-09-14 20:43:40.520985-04	1	45	2	CCT 2000	1	
62	2014-09-14 20:44:02.453672-04	1	45	1	Ariel Premier 2000	2	Changed front_img.
63	2014-09-14 20:44:34.152043-04	1	45	3	CCT 2100	1	
64	2014-09-14 20:45:21.058648-04	1	45	4	CCT P55U	1	
65	2014-09-14 20:45:39.668683-04	1	45	5	CCT P92	1	
66	2014-09-14 20:45:54.538955-04	1	45	6	Lincoln 55	1	
67	2014-09-14 20:46:21.274707-04	1	45	7	Lincoln 55i	1	
68	2014-09-14 20:46:52.008538-04	1	45	8	Lubriquip 76	1	
69	2014-09-14 20:47:10.506376-04	1	45	9	Lubriquip 88	1	
70	2014-09-14 20:47:41.02512-04	1	45	10	Madison-Kipp KLS-DSL	1	
71	2014-09-14 20:48:06.632102-04	1	45	11	Madison-Kipp KLS-SVH	1	
72	2014-09-14 20:50:21.459287-04	1	45	12	Manzel 94V	1	
73	2014-09-14 20:50:35.590757-04	1	45	13	Manzel 100V	1	
74	2014-09-14 20:50:54.071164-04	1	45	14	Mega-McCord 55	1	
75	2014-09-14 20:51:15.183751-04	1	45	15	Premier 55U	1	
81	2014-09-20 17:21:29.235943-04	1	11	9	9	3	
83	2014-09-20 17:22:42.231208-04	1	11	7	7	3	
85	2014-09-20 17:22:58.502064-04	1	11	1	1	3	
86	2014-09-20 17:23:04.339189-04	1	11	1	Home	2	
87	2014-09-20 17:33:47.921688-04	1	11	3	About Us	2	
88	2014-09-20 17:39:00.712783-04	1	11	27	27	3	
89	2014-09-20 17:39:09.245062-04	1	11	28	28	3	
90	2014-09-20 17:39:31.837597-04	1	11	153	153	3	
91	2014-09-20 17:39:53.704132-04	1	11	154	154	3	
92	2014-09-20 17:40:07.107615-04	1	11	155	155	3	
93	2014-09-20 17:44:48.715792-04	1	11	156	156	3	
94	2014-09-20 17:45:41.790911-04	1	11	157	157	3	
95	2014-09-20 20:57:45.28052-04	1	11	158	158	3	
96	2014-09-20 20:58:04.846262-04	1	11	159	159	3	
97	2014-09-20 20:58:51.562831-04	1	11	160	160	3	
98	2014-09-20 22:08:20.45913-04	1	11	162	162	3	
99	2014-09-20 22:10:50.730763-04	1	11	163	163	3	
100	2014-09-20 22:19:48.117146-04	1	11	165	165	3	
101	2014-09-20 22:31:39.8098-04	1	11	166	166	3	
102	2014-09-23 18:02:02.670633-04	1	11	168	168	3	
103	2014-09-23 18:08:45.637465-04	1	11	169	169	3	
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 103, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	log entry	admin	logentry
2	permission	auth	permission
3	group	auth	group
4	user	auth	user
5	content type	contenttypes	contenttype
6	session	sessions	session
7	site	sites	site
8	user setting	cms	usersettings
9	placeholder	cms	placeholder
10	cms plugin	cms	cmsplugin
11	page	cms	page
12	Page global permission	cms	globalpagepermission
13	Page permission	cms	pagepermission
14	User (page)	cms	pageuser
15	User group (page)	cms	pageusergroup
16	title	cms	title
17	placeholder reference	cms	placeholderreference
18	static placeholder	cms	staticplaceholder
19	alias plugin model	cms	aliaspluginmodel
20	cache key	menus	cachekey
21	migration history	south	migrationhistory
22	file	djangocms_file	file
23	google map	djangocms_googlemap	googlemap
24	inherit page placeholder	djangocms_inherit	inheritpageplaceholder
25	picture	djangocms_picture	picture
26	teaser	djangocms_teaser	teaser
27	video	djangocms_video	video
28	link	djangocms_link	link
29	Snippet	djangocms_snippet	snippet
30	Snippet	djangocms_snippet	snippetptr
31	text	djangocms_text_ckeditor	text
32	revision	reversion	revision
33	version	reversion	version
34	gallery plugin	cmsplugin_gallery	galleryplugin
35	image	cmsplugin_gallery	image
36	source	easy_thumbnails	source
37	thumbnail	easy_thumbnails	thumbnail
38	thumbnail dimensions	easy_thumbnails	thumbnaildimensions
39	contact	cmsplugin_contact	contact
40	custom contact	cmsplugin_custom_contact	customcontact
41	search plugin config	cmsplugin_search	searchpluginconfig
42	file gallery plugin	cmsplugin_file_gallery	filegalleryplugin
43	downloadable file	cmsplugin_file_gallery	downloadablefile
44	product category	product_finder	productcategory
45	product	product_finder	product
46	guardiant contact	cmsplugin_guardiant_contact	guardiantcontact
47	image gallery plugin	cmsplugin_image_gallery	imagegalleryplugin
48	gallery image	cmsplugin_image_gallery	galleryimage
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('django_content_type_id_seq', 48, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY django_migrations (id, app, name, applied) FROM stdin;
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('django_migrations_id_seq', 1, false);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
psbrztu7st14bqbjy6ebfzz3o6mcmy1y	NGY0ZGY3Y2NjMGZjZWY4ODMzNDNiYTEwODZjMTg5ZDAwZDQxODM0NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MSwiY21zX2VkaXQiOnRydWV9	2014-09-20 23:19:04.822288-04
2mwonxu3ak36kb9cjnwr8uu1op9e2w9v	ODI0NWY0MzZmYzcwYjBlNWJjZWRkNDYyYWU4NWM0MDk2YmVmNzNjOTp7fQ==	2014-09-28 20:28:32.590077-04
su7gp3l5v5p5o2rwitxe232rkzf54lqc	ZmZlOWE0MGFkZjhmNzVmMmFkODA5MDlkN2Y4NmIzMjU1NWQwNjE0NTp7ImNtc19hZG1pbl9zaXRlIjoxLCJfYXV0aF91c2VyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsImNtc19lZGl0Ijp0cnVlfQ==	2014-10-04 22:35:00.476814-04
kbtqg3qyjey5ifuajkt7cm094nvpoitw	ODI0NWY0MzZmYzcwYjBlNWJjZWRkNDYyYWU4NWM0MDk2YmVmNzNjOTp7fQ==	2014-10-07 17:57:13.823507-04
vb2y7d26u3hh79w8xwsyl0mb9mo6e3is	ZjUyOTY3YWU5NTVjOWM4MTIwODE5NWY0MGJhYjk2NzEyZjdmN2QxOTp7ImNtc19hZG1pbl9zaXRlIjoxLCJjbXNfZWRpdCI6dHJ1ZSwiX2F1dGhfdXNlcl9pZCI6MSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==	2014-09-21 21:36:25.733936-04
dzvrvq0fd6btc1abgpa2yfmj0f2tvihy	NzMwMWUwNWI5Y2RkODYyNTUwOTkzN2NkNzNjMzUxMTdmNmE0MjhhZDp7ImNtc19lZGl0Ijp0cnVlLCJfYXV0aF91c2VyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2014-10-07 17:57:39.715107-04
dy06too70exc8mku1d56hxfukt01k20s	NTRjYzZlOTY4NTJlZGZiNmIxNTg2MGNmYTA3Y2UzOTdhZWM2MzZiNzp7ImNtc19hZG1pbl9zaXRlIjoxLCJjbXNfZWRpdCI6ZmFsc2UsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-09-29 21:12:16.012726-04
edzmccsgr34bzixfbbc55nu8tdxo2sgm	ZTU1ZTA4NmQ2MTQ0NTM0ZDhlNDlkMGJjNGMxZWU0YjQ4ZjFhMGFmNjp7ImNtc19hZG1pbl9zaXRlIjoxLCJjbXNfZWRpdCI6ZmFsc2UsIl9hdXRoX3VzZXJfaWQiOjEsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2014-09-15 21:01:40.87617-04
rw30789u6l4hj55f7cqjsekzlehitn4o	M2NlNDMzOTlhZmEzZjcwYzczYzMwNmY5ZDQxYjliMjU3OTNjZDcwYTp7ImNtc19lZGl0IjpmYWxzZX0=	2014-09-20 22:05:58.268528-04
y8rtcfkvwpsupnui8j6k3svhbtv81ugb	MzAwOWM0MDhhMmZmODFjODY4ZjA0ZDVjYThlZDhmZDU5ZGY0MDdiODp7ImNtc19hZG1pbl9zaXRlIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEsImNtc19lZGl0Ijp0cnVlfQ==	2014-09-28 15:07:57.370521-04
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY django_site (id, domain, name) FROM stdin;
1	guardiant.com	guardiant.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: djangocms_file_file; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY djangocms_file_file (cmsplugin_ptr_id, file, title, target) FROM stdin;
\.


--
-- Data for Name: djangocms_googlemap_googlemap; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY djangocms_googlemap_googlemap (cmsplugin_ptr_id, title, address, zipcode, city, content, zoom, lat, lng, route_planer_title, route_planer, width, height, info_window, scrollwheel, double_click_zoom, draggable, keyboard_shortcuts, pan_control, zoom_control, street_view_control) FROM stdin;
\.


--
-- Data for Name: djangocms_inherit_inheritpageplaceholder; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY djangocms_inherit_inheritpageplaceholder (cmsplugin_ptr_id, from_page_id, from_language) FROM stdin;
\.


--
-- Data for Name: djangocms_link_link; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY djangocms_link_link (cmsplugin_ptr_id, name, url, page_link_id, anchor, mailto, phone, target) FROM stdin;
14	Find a distributor		1				
48	Contact us		1				
49	Find a distributor		1				
94	Contact us		1				
95	Find a distributor		1				
12	Contact Us		\N				
13	Find a distributor		1				
59	Contact Us		\N				
60	Find a distributor		1				
62	Contact Us		\N				
63	Find a distributor		1				
80	Contact Us		\N				
81	Find a distributor		1				
147	Contact Us		\N				
148	Find a distributor		1				
\.


--
-- Data for Name: djangocms_picture_picture; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY djangocms_picture_picture (cmsplugin_ptr_id, image, url, page_link_id, alt, longdesc, "float") FROM stdin;
23	cms_page_media/1/guardiant-truck_1.png		\N			center
50	cms_page_media/1/guardiant-truck_1.png		\N			center
53	cms_page_media/3/about-us_1.png		\N			center
60	cms_page_media/3/guardiant-gauges_1.png		\N			\N
70	cms_page_media/3/guardiant-truck_1.png		\N			\N
72	cms_page_media/3/about-us_1.png		\N			center
87	cms_page_media/3/services-guard.png		\N			\N
103	cms_page_media/3/guardiant-gauges_1.png		\N			\N
105	cms_page_media/5/guardiant-screw.png		\N			\N
107	cms_page_media/5/products-header.png		\N			center
109	cms_page_media/5/guardiant-screw.png		\N			\N
101	cms_page_media/5/products-banner.png		\N			center
15	cms_page_media/3/about-us_2.png		\N			center
30	cms_page_media/8/services-banner_1.png		\N			center
39	cms_page_media/8/service-trucks.png		\N			\N
74	cms_page_media/8/services-banner_1.png		\N			center
77	cms_page_media/8/service-trucks.png		\N			\N
83	cms_page_media/10/distributors-banner.jpg		\N			\N
86	cms_page_media/7/contact-us-banner.jpg		\N			\N
90	cms_page_media/7/contact-us-banner.jpg		\N			\N
151	cms_page_media/3/about-us_2.png		\N			center
\.


--
-- Data for Name: djangocms_snippet_snippet; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY djangocms_snippet_snippet (id, name, html, template) FROM stdin;
\.


--
-- Name: djangocms_snippet_snippet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('djangocms_snippet_snippet_id_seq', 1, false);


--
-- Data for Name: djangocms_snippet_snippetptr; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY djangocms_snippet_snippetptr (cmsplugin_ptr_id, snippet_id) FROM stdin;
\.


--
-- Data for Name: djangocms_teaser_teaser; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY djangocms_teaser_teaser (cmsplugin_ptr_id, title, image, page_link_id, url, description) FROM stdin;
\.


--
-- Data for Name: djangocms_text_ckeditor_text; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY djangocms_text_ckeditor_text (cmsplugin_ptr_id, body) FROM stdin;
82	<p><img title="Picture - distributors-banner.jpg" id="plugin_obj_83" src="/static/cms/img/icons/plugins/image.png" alt="Picture"></p>\n
85	<p><img title="Picture - contact-us-banner.jpg" id="plugin_obj_86" src="/static/cms/img/icons/plugins/image.png" alt="Picture"></p>\n
4	<ul>\n\t<li class="column">\n\t<ul>\n\t\t<li>\n\t\t<h2>WHO WE ARE</h2>\n\t\t</li>\n\t\t<li>\n\t\t<p>Guardiant Lubrication Systems is a privately owned company dedicated to serving the needs of the gas transmission industry. Guardiant's core principle is to always do the next right thing. Our mission is to be the leading lubrication systems company in this industry.</p>\n\t\t</li>\n\t</ul>\n\t</li>\n\t<li class="column">\n\t<ul>\n\t\t<li>\n\t\t<h2>WHAT WE DO</h2>\n\t\t</li>\n\t\t<li>\n\t\t<p>Guardiant Lubrication Systems services the gas transmission industry for all it’s lubrication needs. We sell the finest parts available, service existing systems, design new lubrication systems, and provide state of the art training programs. At Guardiant, we are never satisfied with the way it’s always been done. We believe stagnation in design is moving backwards.</p>\n\t\t</li>\n\t</ul>\n\t</li>\n</ul>\n
89	<p><img title="Picture - contact-us-banner.jpg" id="plugin_obj_90" src="/static/cms/img/icons/plugins/image.png" alt="Picture - contact-us-banner.jpg"></p>\n
10	<ul>\n\t<li class="left-column">\n\t<ul>\n\t\t<li>\n\t\t<h2>How can we help you?</h2>\n\t\t</li>\n\t\t<li>\n\t\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it’s introductory or advanced, Guardiant is ready to fill that need too.</p>\n\t\t</li>\n\t</ul>\n\t</li>\n\t<li class="right-column">\n\t<ul>\n\t\t<li> </li>\n\t\t<li> </li>\n\t</ul>\n\t</li>\n</ul>\n
8	<ul>\n\t<li>\n\t<ul>\n\t\t<li class="title">Our Leadership</li>\n\t\t<li class="meaning">The leadership at Guardiant is headed up by Scott Roys who brings the same innovative and customer centric philosophy that he learned from his father Curtis Roys at CCT. The entire staff is peppered with familiar faces that will remind many people of the way lubrication system services have been and should be run!</li>\n\t</ul>\n\t</li>\n</ul>\n
144	<ul>\n\t<li class="column">\n\t<ul>\n\t\t<li>\n\t\t<h2>WHO WE ARE</h2>\n\t\t</li>\n\t\t<li>\n\t\t<p>Guardiant Lubrication Systems is a privately owned company dedicated to serving the needs of the gas transmission industry. Guardiant's core principle is to always do the next right thing. Our mission is to be the leading lubrication systems company in this industry.</p>\n\t\t</li>\n\t</ul>\n\t</li>\n\t<li class="column">\n\t<ul>\n\t\t<li>\n\t\t<h2>WHAT WE DO</h2>\n\t\t</li>\n\t\t<li>\n\t\t<p>Guardiant Lubrication Systems services the gas transmission industry for all it’s lubrication needs. We sell the finest parts available, service existing systems, design new lubrication systems, and provide state of the art training programs. At Guardiant, we are never satisfied with the way it’s always been done. We believe stagnation in design is moving backwards.</p>\n\t\t</li>\n\t</ul>\n\t</li>\n</ul>\n
145	<ul>\n\t<li>\n\t<ul>\n\t\t<li class="title">Our Leadership</li>\n\t\t<li class="meaning">The leadership at Guardiant is headed up by Scott Roys who brings the same innovative and customer centric philosophy that he learned from his father Curtis Roys at CCT. The entire staff is peppered with familiar faces that will remind many people of the way lubrication system services have been and should be run!</li>\n\t</ul>\n\t</li>\n</ul>\n
146	<ul>\n\t<li class="left-column">\n\t<ul>\n\t\t<li>\n\t\t<h2>How can we help you?</h2>\n\t\t</li>\n\t\t<li>\n\t\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it’s introductory or advanced, Guardiant is ready to fill that need too.</p>\n\t\t</li>\n\t</ul>\n\t</li>\n\t<li class="right-column">\n\t<ul>\n\t\t<li><img title="Link - Contact Us" id="plugin_obj_147" src="/static/cms/img/icons/plugins/link.png" alt="Link - Contact Us"></li>\n\t\t<li><img title="Link - Find a distributor" id="plugin_obj_148" src="/static/cms/img/icons/plugins/link.png" alt="Link - Find a distributor"></li>\n\t</ul>\n\t</li>\n</ul>\n
149	<div class="single-blue">\n<h2>OUR MISSION</h2>\n\n<p>Our Mission is to be the leading lubrication systems company in the industry by providing world class training to our technicians, customers and our global distributor network.  Our mission includes providing only the highest quality products with the most technologically advanced lubrication equipment available in the industry today. We continuously seek out the industries best component manufacturers and by constant research, development and testing of new products and lubrication methods.</p>\n\n<h2>WHO WE ARE</h2>\n\n<p>A compressor lubrication systems company founded on one simple principle, “Always Do the Next Right Thing”.  A single minded quest to take the mystery out of the force feed divider block lubrication system and the components used to make it work.  We accomplish this by not only utilizing the best current products and technology, but also by continuously pushing ourselves to build and improve our products with the latest, superior technology.  A major emphasis is placed on training our staff; from office and shop personnel to highly qualified field service and installation technicians as well as our worldwide distribution networks on the latest, greatest possibilities to help serve our customers while solving their lubrication needs.<br>\n    <br>\nGuardiant continuously studies trends in preventive maintenance and uses that information to develop methodology for true predictive maintenance.  We have the data, background and many years of experience to serve all of our customers compressor lubrication needs.</p>\n\n<p>OEM and direct replacement parts including new innovative manufactured products.  We stock all components for complete systems as well as design engineering and reverse engineering of existing systems.  With our certified-world class training, both on site and remote troubleshooting capability, we are a full 24/7-365 company who will never lose sight that our customers are the only reason we are here.</p>\n\n<p>Whether it is increasing runtime, reliability, and wear-product life or cutting operating cost via oil consumption for one compressor or your entire fleet, Guardiant is your lubrication systems company of choice, today and for many years of trouble free operation.</p>\n\n<h2>OUR VALUES</h2>\n\n<p><strong>L</strong>oyalty - Founded in family principles we are loyal to our employees, distributors and customers<br>\n<strong>U</strong>ncompromising - We are uncompromising in the quality of our products and service<br>\n<strong>B</strong>est - We strive to be the best lubrication company in the industry<br>\n<strong>E</strong>thical - We treat all of our employees, distributors and customers with the highest ethical standards</p>\n\n</div>\n
52	<p class="bb3"><img title="Picture - about-us_1.png" id="plugin_obj_53" src="/static/cms/img/icons/plugins/image.png" alt="Picture"></p>
73	<p><img title="Picture - services-banner_1.png" id="plugin_obj_74" src="/static/cms/img/icons/plugins/image.png" alt="Picture - services-banner_1.png"></p>\n
75	<ul class="two-up-light">\n\t<li class="column">\n\t<ul>\n\t\t<li>\n\t\t<h2>Lube Design</h2>\n\t\t</li>\n\t\t<li>\n\t\t<p>A properly designed lubrication system is essential to the long term profitability of a compressor operation. Proper designs keep mechanical wear to a minimum as well as ensure that only the proper amount of lube is consumed. factors such as rod and piston diameters, operating pressures, field conditions, and gas composition all need to be balanced in a proper design. Part of the design process is scientific, part of the design process is rooted in years of experience. Guardient personnel are the best in the industry.</p>\n\t\t</li>\n\t</ul>\n\t</li>\n\t<li class="column">\n\t<ul>\n\t\t<li>\n\t\t<h2>On Site Analysis</h2>\n\n\t\t<p>In situations where a problem is recurring and can’t seem to be isolated, an on site analysis is the first step in long term resolution. Give us a call and we’ll be happy to discuss the problem. Sometimes the problem isn’t as complicated as it seems and can be identified just by talking through it with one of our knowledgeable people.</p>\n\t\t</li>\n\t</ul>\n\t</li>\n</ul>\n
58	<ul>\n\t<li class="left-column">\n\t<ul>\n\t\t<li>\n\t\t<h2>How can we help you?</h2>\n\t\t</li>\n\t\t<li>\n\t\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it’s introductory or advanced, Guardiant is ready to fill that need too.</p>\n\t\t</li>\n\t</ul>\n\t</li>\n\t<li class="right-column">\n\t<ul>\n\t\t<li><img title="Link - Contact Us" id="plugin_obj_59" src="/static/cms/img/icons/plugins/link.png" alt="Link - Contact Us"></li>\n\t\t<li><img title="Link - Find a distributor" id="plugin_obj_60" src="/static/cms/img/icons/plugins/link.png" alt="Link - Find a distributor"></li>\n\t</ul>\n\t</li>\n</ul>\n
68	<p class="bb3"><img title="Picture - guardiant-truck_1.png" id="plugin_obj_70" src="/static/cms/img/icons/plugins/image.png" alt="Picture"></p>\n
71	<p class="bb3"><img title="Picture - about-us_1.png" id="plugin_obj_72" src="/static/cms/img/icons/plugins/image.png" alt="Picture - about-us_1.png"></p>
86	<ul class="about-us-gauges bb3">\n\t<li> \n\t<ul>\n\t\t<li>​<img title="Picture - services-guard.png" id="plugin_obj_87" src="/static/cms/img/icons/plugins/image.png" alt="Picture"></li>\n\t</ul>\n\t</li>\n\t<li> \n\t<ul>\n\t\t<li>\n\t\t<h2>Services</h2>\n\t\t</li>\n\t\t<li>\n\t\t<p>Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. Our rapid response team is here 24/7 365 and we are global in scope. Additionally, Guardiant studies the trends in preventive maintenance and uses that information to develop methodology for true predictive maintenance. We can help you get from the costly reactive maintenvance cycle into a cost effective preventative maintenance plan. Imagine operations where the only downtime is the one you planned for.</p>\n\t\t</li>\n\t</ul>\n\t</li>\n</ul>\n
93	<ul class="help-container">\n\t<li class="left-column">\n\t<ul>\n\t\t<li>\n\t\t<h2>How can we help you?</h2>\n\t\t</li>\n\t\t<li>\n\t\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it’s introductory or advanced, Guardiant is ready to fill that need too.</p>\n\t\t</li>\n\t</ul>\n\t</li>\n\t<li class="right-column">\n\t<ul>\n\t\t<li><img title="Link - Contact us" id="plugin_obj_94" src="/static/cms/img/icons/plugins/link.png" alt="Link - Contact us"></li>\n\t\t<li><img title="Link - Find a distributor" id="plugin_obj_95" src="/static/cms/img/icons/plugins/link.png" alt="Link - Find a distributor"></li>\n\t</ul>\n\t</li>\n</ul>\n
97	<ul class="definition-with-quote">\n\t<li class="definition"> \n\t<ul>\n\t\t<li>\n\t\t<h2>Training</h2>\n\t\t</li>\n\t\t<li>\n\t\t<p>When your work force is ready for the best training available, whether it’s introductory or advanced, Guardiant is ready to fill the need. Guardiant trainers have extensive backgrounds in compressor maintenance and are excellent teachers. High end training aids such as animated videos, comprehensive manuals, and hands on training ensure you get the most effective use of your training dollars. </p>\n\t\t</li>\n\t</ul>\n\t</li>\n\t<li class="quote"> \n\t<ul>\n\t\t<li>“ We believe that excellent training will propel this industry forward. We want to be your asset to help in the field, classroom or even providing assistance with our 24/7/365 service line.”</li>\n\t\t<li class="whom">Scott Roys</li>\n\t</ul>\n\t</li>\n</ul>
104	<ul class="about-us-gauges bb3">\n\t<li> \n\t<ul>\n\t\t<li>\n\t\t<h2>OVERVIEW</h2>\n\t\t</li>\n\t\t<li>\n\t\t<p>Guardiant is committed to supplying high quality parts as quickly as possible. Our warehouse is kept stocked and in almost all cases, we can fulfill your requests immediately. Because parts can be highly configurable or cosmetically similar but functionally different, we always suggest that you talk with our staff before ordering. Our staff members are highly trained and have years of experience in the lubrication field. </p>\n\t\t</li>\n\t</ul>\n\t</li>\n\t<li> \n\t<ul>\n\t\t<li><img title="Picture - guardiant-screw.png" id="plugin_obj_105" src="/static/cms/img/icons/plugins/image.png" alt="Picture"></li>\n\t</ul>\n\t</li>\n</ul>\n
106	<p class="bb3"><img title="Picture - products-header.png" id="plugin_obj_107" src="/static/cms/img/icons/plugins/image.png" alt="Picture - products-header.png"></p>\n
102	<ul class="about-us-gauges bb3">\n\t<li> \n\t<ul>\n\t\t<li>\n\t\t<h2>Replacement Parts</h2>\n\t\t</li>\n\t\t<li>\n\t\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Parts manufactured for Guardiant are made with the best materials available and meet the tightest tolerances in the industry. Our highly trained staff is ready to assist you in identifying the exact part you need and getting it into your hands as quickly as possible. We know compressors and we know how to get you rolling again.</p>\n\t\t</li>\n\t</ul>\n\t</li>\n\t<li> \n\t<ul>\n\t\t<li><img title="Picture - guardiant-gauges_1.png" id="plugin_obj_103" src="/static/cms/img/icons/plugins/image.png" alt="Picture - guardiant-gauges_1.png"></li>\n\t</ul>\n\t</li>\n</ul>\n
108	<ul class="about-us-gauges bb3">\n\t<li> \n\t<ul>\n\t\t<li>\n\t\t<h2>OVERVIEW</h2>\n\t\t</li>\n\t\t<li>\n\t\t<p>Guardiant is committed to supplying high quality parts as quickly as possible. Our warehouse is kept stocked and in almost all cases, we can fulfill your requests immediately. Because parts can be highly configurable or cosmetically similar but functionally different, we always suggest that you talk with our staff before ordering. Our staff members are highly trained and have years of experience in the lubrication field. </p>\n\t\t</li>\n\t</ul>\n\t</li>\n\t<li> \n\t<ul>\n\t\t<li><img title="Picture - guardiant-screw.png" id="plugin_obj_109" src="/static/cms/img/icons/plugins/image.png" alt="Picture - guardiant-screw.png"></li>\n\t</ul>\n\t</li>\n</ul>\n
100	<p class="header"><img title="Picture - products-banner.png" id="plugin_obj_101" src="/static/cms/img/icons/plugins/image.png" alt="Picture"></p>\n
150	<p class="bb3"><img title="Picture - about-us_2.png" id="plugin_obj_151" src="/static/cms/img/icons/plugins/image.png" alt="Picture - about-us_2.png"></p>\n
11	<ul>\n\t<li class="left-column">\n\t<ul>\n\t\t<li>\n\t\t<h2>How can we help you?</h2>\n\t\t</li>\n\t\t<li>\n\t\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it’s introductory or advanced, Guardiant is ready to fill that need too.</p>\n\t\t</li>\n\t</ul>\n\t</li>\n\t<li class="right-column">\n\t<ul>\n\t\t<li><img title="Link - Contact Us" id="plugin_obj_12" src="/static/cms/img/icons/plugins/link.png" alt="Link"></li>\n\t\t<li><img title="Link - Find a distributor" id="plugin_obj_13" src="/static/cms/img/icons/plugins/link.png" alt="Link"></li>\n\t</ul>\n\t</li>\n</ul>\n
14	<p class="bb3"><img title="Picture - about-us_2.png" id="plugin_obj_15" src="/static/cms/img/icons/plugins/image.png" alt="Picture"></p>\n
38	<p><img title="Picture - service-trucks.png" id="plugin_obj_39" src="/static/cms/img/icons/plugins/image.png" alt="Picture"></p>\n
152	<div class="single-blue">\n<h2>OUR MISSION</h2>\n\n<p>Our Mission is to be the leading lubrication systems company in the industry by providing world class training to our technicians, customers and our global distributor network.  Our mission includes providing only the highest quality products with the most technologically advanced lubrication equipment available in the industry today. We continuously seek out the industries best component manufacturers and by constant research, development and testing of new products and lubrication methods.</p>\n\n<h2>WHO WE ARE</h2>\n\n<p>A compressor lubrication systems company founded on one simple principle, “Always Do the Next Right Thing”.  A single minded quest to take the mystery out of the force feed divider block lubrication system and the components used to make it work.  We accomplish this by not only utilizing the best current products and technology, but also by continuously pushing ourselves to build and improve our products with the latest, superior technology.  A major emphasis is placed on training our staff; from office and shop personnel to highly qualified field service and installation technicians as well as our worldwide distribution networks on the latest, greatest possibilities to help serve our customers while solving their lubrication needs.<br>\n    <br>\nGuardiant continuously studies trends in preventive maintenance and uses that information to develop methodology for true predictive maintenance.  We have the data, background and many years of experience to serve all of our customers compressor lubrication needs.</p>\n\n<p>OEM and direct replacement parts including new innovative manufactured products.  We stock all components for complete systems as well as design engineering and reverse engineering of existing systems.  With our certified-world class training, both on site and remote troubleshooting capability, we are a full 24/7-365 company who will never lose sight that our customers are the only reason we are here.</p>\n\n<p>Whether it is increasing runtime, reliability, and wear-product life or cutting operating cost via oil consumption for one compressor or your entire fleet, Guardiant is your lubrication systems company of choice, today and for many years of trouble free operation.</p>\n\n<h2>OUR VALUES</h2>\n\n<p><strong>L</strong>oyalty - Founded in family principles we are loyal to our employees, distributors and customers<br>\n<strong>U</strong>ncompromising - We are uncompromising in the quality of our products and service<br>\n<strong>B</strong>est - We strive to be the best lubrication company in the industry<br>\n<strong>E</strong>thical - We treat all of our employees, distributors and customers with the highest ethical standards</p>\n\n</div>\n
29	<p><img title="Picture - services-banner_1.png" id="plugin_obj_30" src="/static/cms/img/icons/plugins/image.png" alt="Picture"></p>\n
37	<ul class="two-up-light">\n\t<li class="column">\n\t<ul>\n\t\t<li>\n\t\t<h2>Lube Design</h2>\n\t\t</li>\n\t\t<li>\n\t\t<p>A properly designed lubrication system is essential to the long term profitability of a compressor operation. Proper designs keep mechanical wear to a minimum as well as ensure that only the proper amount of lube is consumed. factors such as rod and piston diameters, operating pressures, field conditions, and gas composition all need to be balanced in a proper design. Part of the design process is scientific, part of the design process is rooted in years of experience. Guardient personnel are the best in the industry.</p>\n\t\t</li>\n\t</ul>\n\t</li>\n\t<li class="column">\n\t<ul>\n\t\t<li>\n\t\t<h2>On Site Analysis</h2>\n\n\t\t<p>In situations where a problem is recurring and can’t seem to be isolated, an on site analysis is the first step in long term resolution. Give us a call and we’ll be happy to discuss the problem. Sometimes the problem isn’t as complicated as it seems and can be identified just by talking through it with one of our knowledgeable people.</p>\n\t\t</li>\n\t</ul>\n\t</li>\n</ul>\n
50	<ul class="two-up-blue">\n\t<li class="column">\n\t<ul>\n\t\t<li>\n\t\t<h2>Installation</h2>\n\t\t</li>\n\t\t<li>\n\t\t<p>A properly installed lubrication system will eliminate many headaches you will otherwise encounter. In fact, poorly or improperly installed systems are one of the leading causes of system problems. The installation teams at Guardiant are sticklers for getting every detail right.</p>\n\t\t</li>\n\t</ul>\n\t</li>\n\t<li class="column">\n\t<ul>\n\t\t<li>\n\t\t<h2>Stand Alone Lube System</h2>\n\t\t</li>\n\t\t<li>\n\t\t<p>Guardiant builds stand alone lubrication systems that can be set up anywhere, that run independent of any compressor drives, and are designed to fit your specific lubrication needs. The applications for these versatile units are wide open. Anywhere an independant and precision lube source is required.</p>\n\t\t</li>\n\t</ul>\n\t</li>\n</ul>\n
61	<ul class="help-container">\n\t<li class="left-column">\n\t<ul>\n\t\t<li>\n\t\t<h2>How can we help you?</h2>\n\t\t</li>\n\t\t<li>\n\t\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it’s introductory or advanced, Guardiant is ready to fill that need too.</p>\n\t\t</li>\n\t</ul>\n\t</li>\n\t<li class="right-column">\n\t<ul>\n\t\t<li><img title="Link - Contact Us" id="plugin_obj_62" src="/static/cms/img/icons/plugins/link.png" alt="Link - Contact Us"></li>\n\t\t<li><img title="Link - Find a distributor" id="plugin_obj_63" src="/static/cms/img/icons/plugins/link.png" alt="Link - Find a distributor"></li>\n\t</ul>\n\t</li>\n</ul>\n
76	<p><img title="Picture - service-trucks.png" id="plugin_obj_77" src="/static/cms/img/icons/plugins/image.png" alt="Picture - service-trucks.png"></p>\n
78	<ul class="two-up-blue">\n\t<li class="column">\n\t<ul>\n\t\t<li>\n\t\t<h2>Installation</h2>\n\t\t</li>\n\t\t<li>\n\t\t<p>A properly installed lubrication system will eliminate many headaches you will otherwise encounter. In fact, poorly or improperly installed systems are one of the leading causes of system problems. The installation teams at Guardiant are sticklers for getting every detail right.</p>\n\t\t</li>\n\t</ul>\n\t</li>\n\t<li class="column">\n\t<ul>\n\t\t<li>\n\t\t<h2>Stand Alone Lube System</h2>\n\t\t</li>\n\t\t<li>\n\t\t<p>Guardiant builds stand alone lubrication systems that can be set up anywhere, that run independent of any compressor drives, and are designed to fit your specific lubrication needs. The applications for these versatile units are wide open. Anywhere an independant and precision lube source is required.</p>\n\t\t</li>\n\t</ul>\n\t</li>\n</ul>\n
79	<ul class="help-container">\n\t<li class="left-column">\n\t<ul>\n\t\t<li>\n\t\t<h2>How can we help you?</h2>\n\t\t</li>\n\t\t<li>\n\t\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it’s introductory or advanced, Guardiant is ready to fill that need too.</p>\n\t\t</li>\n\t</ul>\n\t</li>\n\t<li class="right-column">\n\t<ul>\n\t\t<li><img title="Link - Contact Us" id="plugin_obj_80" src="/static/cms/img/icons/plugins/link.png" alt="Link - Contact Us"></li>\n\t\t<li><img title="Link - Find a distributor" id="plugin_obj_81" src="/static/cms/img/icons/plugins/link.png" alt="Link - Find a distributor"></li>\n\t</ul>\n\t</li>\n</ul>\n
\.


--
-- Data for Name: djangocms_video_video; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY djangocms_video_video (cmsplugin_ptr_id, movie, movie_url, image, width, height, auto_play, auto_hide, fullscreen, loop, bgcolor, textcolor, seekbarcolor, seekbarbgcolor, loadingbarcolor, buttonoutcolor, buttonovercolor, buttonhighlightcolor) FROM stdin;
\.


--
-- Data for Name: easy_thumbnails_source; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY easy_thumbnails_source (id, name, modified, storage_hash) FROM stdin;
1	cms_page_media/1/services-banner_1.png	2014-09-20 10:33:39.251937-04	f9bde26a1556cd667f742bd34ec7c55e
2	cms_page_media/1/quote-bg.png	2014-09-20 10:52:21.783448-04	f9bde26a1556cd667f742bd34ec7c55e
3	cms_page_media/1/contact-us-banner.jpg	2014-09-20 10:52:21.878607-04	f9bde26a1556cd667f742bd34ec7c55e
4	cms_page_media/1/distributors-banner.png	2014-09-20 10:52:22.033455-04	f9bde26a1556cd667f742bd34ec7c55e
5	cms_page_media/1/services-banner.png	2014-09-20 10:52:22.186611-04	f9bde26a1556cd667f742bd34ec7c55e
6	cms_page_media/1/products-header.png	2014-09-20 10:52:22.360448-04	f9bde26a1556cd667f742bd34ec7c55e
7	cms_page_media/1/services-guard.png	2014-09-20 10:52:22.486295-04	f9bde26a1556cd667f742bd34ec7c55e
8	cms_page_media/1/Spare-Parts.jpg	2014-09-20 16:39:12.403908-04	f9bde26a1556cd667f742bd34ec7c55e
9	cms_page_media/1/Support.jpg	2014-09-20 16:39:12.490223-04	f9bde26a1556cd667f742bd34ec7c55e
10	cms_page_media/1/distributors.jpg	2014-09-20 16:39:12.519287-04	f9bde26a1556cd667f742bd34ec7c55e
11	cms_page_media/1/Training.jpg	2014-09-20 16:39:12.548921-04	f9bde26a1556cd667f742bd34ec7c55e
12	cms_page_media/1/What's-new.jpg	2014-09-20 16:39:12.57653-04	f9bde26a1556cd667f742bd34ec7c55e
\.


--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('easy_thumbnails_source_id_seq', 12, true);


--
-- Data for Name: easy_thumbnails_thumbnail; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY easy_thumbnails_thumbnail (id, name, modified, source_id, storage_hash) FROM stdin;
1	cms_page_media/1/services-banner_1.png.960x536_q85_crop.png	2014-09-20 10:33:39.269051-04	1	d26becbf46ac48eda79c7a39a13a02dd
2	cms_page_media/1/quote-bg.png.320x179_q85_crop.png	2014-09-20 10:47:19.839759-04	2	d26becbf46ac48eda79c7a39a13a02dd
3	cms_page_media/1/contact-us-banner.jpg.320x179_q85_crop.jpg	2014-09-20 10:47:19.900445-04	3	d26becbf46ac48eda79c7a39a13a02dd
4	cms_page_media/1/distributors-banner.png.320x179_q85_crop.png	2014-09-20 10:47:20.021717-04	4	d26becbf46ac48eda79c7a39a13a02dd
5	cms_page_media/1/services-banner.png.320x179_q85_crop.png	2014-09-20 10:47:20.157717-04	5	d26becbf46ac48eda79c7a39a13a02dd
6	cms_page_media/1/products-header.png.320x179_q85_crop.png	2014-09-20 10:47:20.273553-04	6	d26becbf46ac48eda79c7a39a13a02dd
7	cms_page_media/1/services-guard.png.320x179_q85_crop.png	2014-09-20 10:47:20.356882-04	7	d26becbf46ac48eda79c7a39a13a02dd
8	cms_page_media/1/contact-us-banner.jpg.960x536_q85_crop.jpg	2014-09-20 10:51:55.682189-04	3	d26becbf46ac48eda79c7a39a13a02dd
9	cms_page_media/1/distributors-banner.png.960x536_q85_crop.png	2014-09-20 10:51:56.11081-04	4	d26becbf46ac48eda79c7a39a13a02dd
10	cms_page_media/1/services-banner.png.960x536_q85_crop.png	2014-09-20 10:51:56.567051-04	5	d26becbf46ac48eda79c7a39a13a02dd
11	cms_page_media/1/products-header.png.960x536_q85_crop.png	2014-09-20 10:51:57.060148-04	6	d26becbf46ac48eda79c7a39a13a02dd
12	cms_page_media/1/services-guard.png.960x536_q85_crop.png	2014-09-20 10:51:57.24974-04	7	d26becbf46ac48eda79c7a39a13a02dd
13	cms_page_media/1/quote-bg.png.320x190_q85_crop.png	2014-09-20 10:52:21.801585-04	2	d26becbf46ac48eda79c7a39a13a02dd
14	cms_page_media/1/contact-us-banner.jpg.320x190_q85_crop.jpg	2014-09-20 10:52:21.895416-04	3	d26becbf46ac48eda79c7a39a13a02dd
15	cms_page_media/1/distributors-banner.png.320x190_q85_crop.png	2014-09-20 10:52:22.050272-04	4	d26becbf46ac48eda79c7a39a13a02dd
16	cms_page_media/1/services-banner.png.320x190_q85_crop.png	2014-09-20 10:52:22.201782-04	5	d26becbf46ac48eda79c7a39a13a02dd
17	cms_page_media/1/products-header.png.320x190_q85_crop.png	2014-09-20 10:52:22.374886-04	6	d26becbf46ac48eda79c7a39a13a02dd
18	cms_page_media/1/services-guard.png.320x190_q85_crop.png	2014-09-20 10:52:22.502423-04	7	d26becbf46ac48eda79c7a39a13a02dd
19	cms_page_media/1/Spare-Parts.jpg.320x190_q85_crop.jpg	2014-09-20 16:39:12.468012-04	8	d26becbf46ac48eda79c7a39a13a02dd
20	cms_page_media/1/Support.jpg.320x190_q85_crop.jpg	2014-09-20 16:39:12.498128-04	9	d26becbf46ac48eda79c7a39a13a02dd
21	cms_page_media/1/distributors.jpg.320x190_q85_crop.jpg	2014-09-20 16:39:12.527812-04	10	d26becbf46ac48eda79c7a39a13a02dd
22	cms_page_media/1/Training.jpg.320x190_q85_crop.jpg	2014-09-20 16:39:12.557248-04	11	d26becbf46ac48eda79c7a39a13a02dd
23	cms_page_media/1/What's-new.jpg.320x190_q85_crop.jpg	2014-09-20 16:39:12.58438-04	12	d26becbf46ac48eda79c7a39a13a02dd
\.


--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnail_id_seq', 23, true);


--
-- Data for Name: easy_thumbnails_thumbnaildimensions; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY easy_thumbnails_thumbnaildimensions (id, thumbnail_id, width, height) FROM stdin;
\.


--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnaildimensions_id_seq', 1, false);


--
-- Data for Name: menus_cachekey; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY menus_cachekey (id, language, site, key) FROM stdin;
212	en	1	menu_cache_menu_nodes_en_1_1_user
\.


--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('menus_cachekey_id_seq', 212, true);


--
-- Data for Name: product_finder_product; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY product_finder_product (id, name, category_id, description, slug, front_img, back_img, ortho_img, download_file) FROM stdin;
2	CCT 2000	3		cct-2000	products/3/None/cct_2000_pressurized_roller.png			
1	Ariel Premier 2000	3		ariel-premier-2000	products/3/1/Premier_2000_pressurized_roller.png			
3	CCT 2100	3		cct-2100	products/3/None/cct_2100_box.png			
4	CCT P55U	3		cct-p55u	products/3/None/p55u91211.png			
5	CCT P92	3		cct-p92	products/3/None/cct_P92.png			
6	Lincoln 55	3		lincoln-55	products/3/None/lincoln_55_box.png			
7	Lincoln 55i	3		lincoln-55i	products/3/None/Lincoln_55i_pressurized_standard.png			
8	Lubriquip 76	3		lubriquip-76	products/3/None/Lubriquip_76_pressurized_rocker.png			
9	Lubriquip 88	3		lubriquip-88	products/3/None/Lubriquip_88_box_roller.png			
10	Madison-Kipp KLS-DSL	3		madison-kipp-kls-dsl	products/3/None/Madison_Kipp_KLS-DSL_box.png			
11	Madison-Kipp KLS-SVH	3		madison-kipp-kls-svh	products/3/None/Madison_Kipp_KLS-SVH_pressurized.png			
12	Manzel 94V	3		manzel-94v	products/3/None/cct_P92_1.png			
13	Manzel 100V	3		manzel-100v	products/3/None/Manzell_100v_pressurized.png			
14	Mega-McCord 55	3		mega-mccord-55	products/3/None/Mega_McCord_55.png			
15	Premier 55U	3		premier-55u	products/3/None/Premier_55U_box_standard.png			
\.


--
-- Name: product_finder_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('product_finder_product_id_seq', 15, true);


--
-- Data for Name: product_finder_productcategory; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY product_finder_productcategory (id, title, slug, img, ordering) FROM stdin;
1	System Protection	system-protection	products/None/system-protection.png	1
2	Lubrication Boxes	lubrication-boxes	products/None/lubrication-box.png	2
3	Lubrication Pumps	lubrication-pumps	products/None/lubrication-pump.png	3
4	HV Pumps & Boxes	hv-pumps-boxes	products/None/HVLP_GearBox.png	4
5	Divider Blocks	divider-blocks	products/None/divblock.png	5
6	Gauges & Manifolds	gauges-manifolds	products/None/EFMT.png	6
7	Filters	filters	products/None/filter.png	7
8	Check Valves & Fittings	check-valves-fittings	products/None/check-valve.png	8
9	Tools	tools	products/None/purge_gun.png	9
\.


--
-- Name: product_finder_productcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('product_finder_productcategory_id_seq', 9, true);


--
-- Data for Name: reversion_revision; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY reversion_revision (id, manager_slug, date_created, user_id, comment) FROM stdin;
1	default	2014-09-01 20:20:41.638235-04	1	Initial version.
3	default	2014-09-01 20:22:42.507326-04	1	Publish
107	default	2014-09-07 20:02:53.003409-04	1	Picture plugin at position 4 in template_1_content was deleted.
7	default	2014-09-06 22:36:18.523315-04	1	Publish
108	default	2014-09-07 20:04:27.597739-04	1	Text plugin added to template_1_content
9	default	2014-09-06 22:54:56.243586-04	1	Publish
109	default	2014-09-07 20:06:28.121464-04	1	Text plugin edited at position 12 in template_1_content
110	default	2014-09-07 20:16:15.626005-04	1	Text plugin edited at position 12 in template_1_content
111	default	2014-09-07 21:21:02.190492-04	1	Text plugin edited at position 12 in template_1_content
13	default	2014-09-06 23:16:06.951595-04	1	Publish
112	default	2014-09-07 21:24:09.845501-04	1	Plugins were moved
113	default	2014-09-07 21:25:48.331683-04	1	Initial version.
114	default	2014-09-07 21:28:17.987038-04	1	Template changed to Products
115	default	2014-09-07 21:29:07.354077-04	1	Copied plugins to base_content
116	default	2014-09-07 21:30:00.96066-04	1	Picture plugin edited at position 0 in base_content
117	default	2014-09-07 21:30:01.724698-04	1	Text plugin edited at position 0 in base_content
118	default	2014-09-07 21:30:24.531674-04	1	Text plugin edited at position 0 in base_content
119	default	2014-09-07 21:33:14.229647-04	1	Copied plugins to general
120	default	2014-09-07 21:34:25.584861-04	1	Picture plugin edited at position 0 in general
121	default	2014-09-07 21:34:56.032664-04	1	Text plugin edited at position 1 in general
122	default	2014-09-07 21:35:10.827068-04	1	Publish
123	default	2014-09-07 21:36:36.890471-04	1	Picture plugin edited at position 0 in base_content
124	default	2014-09-07 21:36:49.662922-04	1	Text plugin edited at position 0 in base_content
125	default	2014-09-14 14:50:33.2662-04	1	Initial version.
244	default	2014-09-20 21:00:50.513153-04	1	Guardiant Contact Form plugin added to template_1_content
245	default	2014-09-20 21:41:16.946826-04	1	Contact Form plugin added to template_1_content
246	default	2014-09-20 21:42:07.75203-04	1	Contact Form plugin edited at position 2 in template_1_content
247	default	2014-09-20 22:05:55.681454-04	1	Guardiant Contact Form plugin added to template_1_content
248	default	2014-09-20 22:06:09.327529-04	1	Guardiant Contact Form plugin edited at position 3 in template_1_content
249	default	2014-09-20 22:08:20.72072-04	1	Contact Form plugin at position 2 in template_1_content was deleted.
47	default	2014-09-07 15:59:39.762682-04	1	Publish
51	default	2014-09-07 16:14:33.718161-04	1	Publish
53	default	2014-09-07 16:15:26.720023-04	1	Publish
56	default	2014-09-07 19:09:15.380762-04	1	Publish
57	default	2014-09-07 19:09:31.854079-04	1	Initial version.
58	default	2014-09-07 19:09:52.292773-04	1	Publish
68	default	2014-09-07 19:15:12.196681-04	1	Publish
149	default	2014-09-14 16:04:34.35662-04	1	Text plugin added to template_1_content
150	default	2014-09-14 16:04:49.997206-04	1	Text plugin edited at position 0 in template_1_content
151	default	2014-09-14 16:05:20.154863-04	1	Picture plugin added to template_1_content
152	default	2014-09-14 16:06:11.552362-04	1	Picture plugin edited at position 0 in template_1_content
153	default	2014-09-14 16:06:13.357343-04	1	Text plugin edited at position 0 in template_1_content
154	default	2014-09-14 16:06:44.481367-04	1	Publish
155	default	2014-09-14 16:06:53.256018-04	1	Publish
158	default	2014-09-14 16:34:02.979584-04	1	Initial version.
84	default	2014-09-07 19:38:08.003514-04	1	Publish
163	default	2014-09-14 16:35:42.548259-04	1	Publish
90	default	2014-09-07 19:39:53.32376-04	1	Publish
168	default	2014-09-14 16:43:34.541493-04	1	Publish
170	default	2014-09-14 16:44:59.949844-04	1	Copied plugins to template_1_content
171	default	2014-09-14 16:45:08.967528-04	1	Text plugin at position 2 in template_1_content was deleted.
172	default	2014-09-14 16:46:23.450971-04	1	Text plugin edited at position 1 in template_1_content
173	default	2014-09-14 16:47:30.796113-04	1	Text plugin added to template_1_content
174	default	2014-09-14 16:47:36.543964-04	1	Picture plugin added to template_1_content
175	default	2014-09-14 16:47:45.348872-04	1	Picture plugin edited at position 0 in template_1_content
176	default	2014-09-14 16:47:46.769313-04	1	Text plugin edited at position 3 in template_1_content
177	default	2014-09-14 16:48:21.451962-04	1	Publish
178	default	2014-09-14 16:49:29.937896-04	1	Text plugin edited at position 1 in template_1_content
179	default	2014-09-14 16:49:37.932469-04	1	Publish
180	default	2014-09-14 16:52:49.411556-04	1	Text plugin edited at position 1 in template_1_content
181	default	2014-09-14 17:00:02.28403-04	1	Copied plugins to template_1_content
182	default	2014-09-14 17:00:11.606257-04	1	Plugins were moved
183	default	2014-09-14 17:00:17.182135-04	1	Publish
184	default	2014-09-14 17:04:12.736655-04	1	Copied plugins to template_1_content
185	default	2014-09-14 17:04:19.719083-04	1	Plugins were moved
186	default	2014-09-14 17:04:23.033423-04	1	Publish
187	default	2014-09-14 17:05:41.371675-04	1	Text plugin edited at position 4 in template_1_content
188	default	2014-09-14 17:05:54.803266-04	1	Publish
189	default	2014-09-14 17:13:18.206058-04	1	Initial version.
190	default	2014-09-14 17:13:37.946854-04	1	Text plugin added to template_1_content
191	default	2014-09-14 17:13:42.874565-04	1	Picture plugin added to template_1_content
192	default	2014-09-14 17:13:53.052944-04	1	Picture plugin edited at position 0 in template_1_content
193	default	2014-09-14 17:13:54.57623-04	1	Text plugin edited at position 0 in template_1_content
194	default	2014-09-14 17:29:57.435738-04	1	Guardiant Search plugin edited at position 2 in template_1_content
195	default	2014-09-14 17:41:35.449097-04	1	Guardiant Search plugin edited at position 2 in template_1_content
196	default	2014-09-14 17:42:01.691079-04	1	Guardiant Search plugin edited at position 2 in template_1_content
250	default	2014-09-20 22:10:50.944341-04	1	Guardiant Contact Form plugin at position 1 in template_1_content was deleted.
202	default	2014-09-14 18:38:36.607293-04	1	Publish
204	default	2014-09-20 10:33:37.864394-04	1	Image gallery plugin edited at position 0 in slideshow_content
205	default	2014-09-20 16:26:16.44275-04	1	Image gallery plugin edited at position 0 in quote_content
206	default	2014-09-20 16:32:37.950815-04	1	Image gallery plugin edited at position 0 in quote_content
207	default	2014-09-20 17:09:09.419505-04	1	Image gallery plugin edited at position 0 in quote_content
251	default	2014-09-20 22:10:58.151397-04	1	Guardiant Contact Form plugin added to template_1_content
252	default	2014-09-20 22:11:20.688617-04	1	Guardiant Contact Form plugin edited at position 2 in template_1_content
253	default	2014-09-20 22:19:42.982532-04	1	Contact Form plugin added to template_1_content
254	default	2014-09-20 22:19:48.273812-04	1	Contact Form plugin at position 2 in template_1_content was deleted.
255	default	2014-09-20 22:31:32.918133-04	1	Contact Form plugin added to template_1_content
213	default	2014-09-20 17:21:29.469938-04	1	Image gallery plugin at position 0 in grid_content was deleted.
214	default	2014-09-20 17:22:03.745938-04	1	Plugins were moved
215	default	2014-09-20 17:22:07.515789-04	1	Plugins were moved
216	default	2014-09-20 17:22:11.184933-04	1	Plugins were moved
256	default	2014-09-20 22:31:39.968723-04	1	Contact Form plugin at position 2 in template_1_content was deleted.
218	default	2014-09-20 17:22:42.474037-04	1	Image gallery plugin at position 0 in quote_content was deleted.
257	default	2014-09-20 22:34:44.067178-04	1	Contact Form plugin added to template_1_content
220	default	2014-09-20 17:22:58.754266-04	1	Image gallery plugin at position 0 in slideshow_content was deleted.
221	default	2014-09-20 17:23:04.384477-04	1	Publish
222	default	2014-09-20 17:28:43.652619-04	1	Text plugin added to template_1_content
223	default	2014-09-20 17:30:19.121645-04	1	Text plugin edited at position 2 in template_1_content
224	default	2014-09-20 17:31:01.772746-04	1	Text plugin edited at position 2 in template_1_content
225	default	2014-09-20 17:33:47.963298-04	1	Publish
258	default	2014-09-20 22:34:57.336826-04	1	Contact Form plugin edited at position 2 in template_1_content
259	default	2014-09-23 17:57:50.351681-04	1	Image gallery plugin added to slideshow_content
260	default	2014-09-23 18:02:02.839688-04	1	Image gallery plugin at position 0 in slideshow_content was deleted.
261	default	2014-09-23 18:08:09.681441-04	1	Image gallery plugin added to slideshow_content
262	default	2014-09-23 18:08:45.810985-04	1	Image gallery plugin at position 0 in slideshow_content was deleted.
263	default	2014-09-23 18:08:51.872645-04	1	Slideshow Image gallery plugin added to slideshow_content
\.


--
-- Name: reversion_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('reversion_revision_id_seq', 263, true);


--
-- Data for Name: reversion_version; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY reversion_version (id, revision_id, object_id, object_id_int, content_type_id, format, serialized_data, object_repr) FROM stdin;
1	1	1	1	11	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 3], "changed_date": "2014-09-02T00:20:41.556Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-09-02T00:20:41.416Z", "creation_date": "2014-09-02T00:20:41.259Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Home
2	1	2	2	9	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3	1	3	3	9	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
4	1	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 0, "creation_date": "2014-09-02T00:20:41.372Z", "slug": "home", "publisher_public": null}}]	Home (home, en)
819	47	1	1	11	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": "", "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "homepage.html", "tree_id": 1, "placeholders": [2, 3, 6, 7, 8, 9, 10, 11], "changed_date": "2014-09-07T19:59:39.685Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-09-02T00:20:41.416Z", "creation_date": "2014-09-02T00:20:41.259Z", "level": 0, "changed_by": "brandon", "application_urls": "", "xframe_options": 0, "revision_id": 0}}]	Home
820	47	2	2	9	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
821	47	3	3	9	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
822	47	4	4	31	json	[{"pk": 4, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHO WE ARE</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems is a privately owned company dedicated to serving the needs of the gas \\u0003transmission industry. Guardiant's core principle is to always do the next right thing. Our mission is to be the leading lubrication systems company in this industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHAT WE DO</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems services the gas transmission industry for all it\\u2019s lubrication needs. We sell the finest parts available, service existing systems, design new lubrication systems, and provide state of the art training programs. At Guardiant, we are never satisfied with the way it\\u2019s always been done. We believe stagnation in design is moving backwards.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	WHO WE ARE...
9	3	1	1	11	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": "", "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 3], "changed_date": "2014-09-02T00:22:42.448Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-09-02T00:20:41.416Z", "creation_date": "2014-09-02T00:20:41.259Z", "level": 0, "changed_by": "brandon", "application_urls": "", "xframe_options": 0, "revision_id": 0}}]	Home
10	3	2	2	9	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
11	3	3	3	9	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
12	3	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": "", "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 0, "creation_date": "2014-09-02T00:20:41.372Z", "slug": "home", "publisher_public": 2}}]	Home (home, en)
823	47	6	6	9	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content
824	47	1	1	34	json	[{"pk": 1, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/homepage_gallery.html", "title": "Home page Gallery"}}]	1 image(s) in gallery
825	47	8	8	9	json	[{"pk": 8, "model": "cms.placeholder", "fields": {"slot": "quote_content", "default_width": null}}]	quote_content
826	47	9	9	10	json	[{"pk": 9, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-07T19:11:47.714Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T03:46:32.322Z", "lft": 1, "tree_id": 8, "position": 0, "placeholder": 10, "plugin_type": "CMSGalleryPlugin"}}]	9
827	47	10	10	9	json	[{"pk": 10, "model": "cms.placeholder", "fields": {"slot": "grid_content", "default_width": null}}]	grid_content
828	47	11	11	9	json	[{"pk": 11, "model": "cms.placeholder", "fields": {"slot": "help_content", "default_width": null}}]	help_content
829	47	13	13	28	json	[{"pk": 13, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact us", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Contact us
830	47	14	14	28	json	[{"pk": 14, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
831	47	9	9	34	json	[{"pk": 9, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/grid_gallery.html", "title": "Grid Gallery"}}]	5 image(s) in gallery
832	47	4	4	10	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-07T03:21:56.484Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T03:09:24.910Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	4
3873	255	32	32	9	json	[{"pk": 32, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3874	255	33	33	9	json	[{"pk": 33, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
833	47	1	1	10	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-07T02:54:19.601Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T02:10:25.018Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 6, "plugin_type": "CMSGalleryPlugin"}}]	1
834	47	7	7	9	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "mission_content", "default_width": null}}]	mission_content
835	47	8	8	31	json	[{"pk": 8, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li>\\n\\t<ul>\\n\\t\\t<li class=\\"title\\">Our Leadership</li>\\n\\t\\t<li class=\\"meaning\\">The leadership at Guardiant is headed up by Scott Roys who brings the same innovative and customer centric philosophy that he learned from his father Curtis Roys at CCT. The entire staff is peppered with familiar faces that will remind many people of the way lubrication system services have been and should be run!</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Our Leadership The...
836	47	10	10	31	json	[{"pk": 10, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact us\\" id=\\"plugin_obj_13\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_14\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
837	47	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": "", "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 0, "creation_date": "2014-09-02T00:20:41.372Z", "slug": "home", "publisher_public": 2}}]	Home (home, en)
838	47	9	9	9	json	[{"pk": 9, "model": "cms.placeholder", "fields": {"slot": "creto_content", "default_width": null}}]	creto_content
839	47	7	7	10	json	[{"pk": 7, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-07T03:34:08.742Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T03:33:14.513Z", "lft": 1, "tree_id": 6, "position": 0, "placeholder": 8, "plugin_type": "CMSGalleryPlugin"}}]	7
840	47	10	10	10	json	[{"pk": 10, "model": "cms.cmsplugin", "fields": {"rght": 10, "changed_date": "2014-09-07T19:53:45.727Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T19:38:55.995Z", "lft": 1, "tree_id": 9, "position": 0, "placeholder": 11, "plugin_type": "TextPlugin"}}]	10
1068	56	1	1	11	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": "", "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "homepage.html", "tree_id": 1, "placeholders": [2, 3, 6, 7, 8, 9, 10, 11], "changed_date": "2014-09-07T23:09:15.285Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-09-02T00:20:41.416Z", "creation_date": "2014-09-02T00:20:41.259Z", "level": 0, "changed_by": "brandon", "application_urls": "", "xframe_options": 0, "revision_id": 0}}]	Home
1069	56	2	2	9	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
1070	56	3	3	9	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3875	255	86	86	25	json	[{"pk": 86, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/7/contact-us-banner.jpg", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	contact-us-banner.jpg
2784	176	30	30	25	json	[{"pk": 30, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/services-banner_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	services-banner_1.png
46	7	1	1	11	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": "", "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "homepage.html", "tree_id": 1, "placeholders": [2, 3, 6, 7, 8, 9, 10, 11], "changed_date": "2014-09-07T02:36:18.421Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-09-02T00:20:41.416Z", "creation_date": "2014-09-02T00:20:41.259Z", "level": 0, "changed_by": "brandon", "application_urls": "", "xframe_options": 0, "revision_id": 0}}]	Home
47	7	2	2	9	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
48	7	3	3	9	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
49	7	1	1	34	json	[{"pk": 1, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/gallery.html", "title": "Home page Gallery"}}]	1 image(s) in gallery
50	7	6	6	9	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content
51	7	7	7	9	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "mission_content", "default_width": null}}]	mission_content
52	7	8	8	9	json	[{"pk": 8, "model": "cms.placeholder", "fields": {"slot": "quote_content", "default_width": null}}]	quote_content
53	7	9	9	9	json	[{"pk": 9, "model": "cms.placeholder", "fields": {"slot": "creto_content", "default_width": null}}]	creto_content
54	7	10	10	9	json	[{"pk": 10, "model": "cms.placeholder", "fields": {"slot": "grid_content", "default_width": null}}]	grid_content
55	7	11	11	9	json	[{"pk": 11, "model": "cms.placeholder", "fields": {"slot": "help_content", "default_width": null}}]	help_content
56	7	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": "", "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 0, "creation_date": "2014-09-02T00:20:41.372Z", "slug": "home", "publisher_public": 2}}]	Home (home, en)
57	7	1	1	10	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-07T02:30:52.213Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T02:10:25.018Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 6, "plugin_type": "CMSGalleryPlugin"}}]	1
1071	56	4	4	31	json	[{"pk": 4, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHO WE ARE</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems is a privately owned company dedicated to serving the needs of the gas \\u0003transmission industry. Guardiant's core principle is to always do the next right thing. Our mission is to be the leading lubrication systems company in this industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHAT WE DO</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems services the gas transmission industry for all it\\u2019s lubrication needs. We sell the finest parts available, service existing systems, design new lubrication systems, and provide state of the art training programs. At Guardiant, we are never satisfied with the way it\\u2019s always been done. We believe stagnation in design is moving backwards.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	WHO WE ARE...
1072	56	6	6	9	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content
1073	56	1	1	34	json	[{"pk": 1, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/homepage_gallery.html", "title": "Home page Gallery"}}]	1 image(s) in gallery
1074	56	8	8	9	json	[{"pk": 8, "model": "cms.placeholder", "fields": {"slot": "quote_content", "default_width": null}}]	quote_content
1075	56	9	9	10	json	[{"pk": 9, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-07T23:06:32.883Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T03:46:32.322Z", "lft": 1, "tree_id": 8, "position": 0, "placeholder": 10, "plugin_type": "CMSGalleryPlugin"}}]	9
1076	56	10	10	9	json	[{"pk": 10, "model": "cms.placeholder", "fields": {"slot": "grid_content", "default_width": null}}]	grid_content
1077	56	11	11	9	json	[{"pk": 11, "model": "cms.placeholder", "fields": {"slot": "help_content", "default_width": null}}]	help_content
1078	56	13	13	28	json	[{"pk": 13, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact us", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Contact us
1079	56	14	14	28	json	[{"pk": 14, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
1080	56	9	9	34	json	[{"pk": 9, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/grid_gallery.html", "title": "Grid Gallery"}}]	5 image(s) in gallery
1081	56	23	23	10	json	[{"pk": 23, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-07T20:15:12.899Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T20:13:21.199Z", "lft": 1, "tree_id": 16, "position": 3, "placeholder": 11, "plugin_type": "PicturePlugin"}}]	23
1082	56	4	4	10	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-07T03:21:56.484Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T03:09:24.910Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	4
70	9	1	1	11	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": "", "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "homepage.html", "tree_id": 1, "placeholders": [2, 3, 6, 7, 8, 9, 10, 11], "changed_date": "2014-09-07T02:54:56.181Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-09-02T00:20:41.416Z", "creation_date": "2014-09-02T00:20:41.259Z", "level": 0, "changed_by": "brandon", "application_urls": "", "xframe_options": 0, "revision_id": 0}}]	Home
71	9	2	2	9	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
72	9	3	3	9	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
73	9	1	1	34	json	[{"pk": 1, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/homepage_gallery.html", "title": "Home page Gallery"}}]	1 image(s) in gallery
74	9	6	6	9	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content
75	9	7	7	9	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "mission_content", "default_width": null}}]	mission_content
76	9	8	8	9	json	[{"pk": 8, "model": "cms.placeholder", "fields": {"slot": "quote_content", "default_width": null}}]	quote_content
77	9	9	9	9	json	[{"pk": 9, "model": "cms.placeholder", "fields": {"slot": "creto_content", "default_width": null}}]	creto_content
78	9	10	10	9	json	[{"pk": 10, "model": "cms.placeholder", "fields": {"slot": "grid_content", "default_width": null}}]	grid_content
79	9	11	11	9	json	[{"pk": 11, "model": "cms.placeholder", "fields": {"slot": "help_content", "default_width": null}}]	help_content
80	9	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": "", "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 0, "creation_date": "2014-09-02T00:20:41.372Z", "slug": "home", "publisher_public": 2}}]	Home (home, en)
81	9	1	1	10	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-07T02:54:19.601Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T02:10:25.018Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 6, "plugin_type": "CMSGalleryPlugin"}}]	1
1083	56	1	1	10	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-07T02:54:19.601Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T02:10:25.018Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 6, "plugin_type": "CMSGalleryPlugin"}}]	1
1084	56	7	7	34	json	[{"pk": 7, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/quote_gallery.html", "title": "Quote Gallery"}}]	1 image(s) in gallery
1085	56	8	8	31	json	[{"pk": 8, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li>\\n\\t<ul>\\n\\t\\t<li class=\\"title\\">Our Leadership</li>\\n\\t\\t<li class=\\"meaning\\">The leadership at Guardiant is headed up by Scott Roys who brings the same innovative and customer centric philosophy that he learned from his father Curtis Roys at CCT. The entire staff is peppered with familiar faces that will remind many people of the way lubrication system services have been and should be run!</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Our Leadership The...
1086	56	10	10	10	json	[{"pk": 10, "model": "cms.cmsplugin", "fields": {"rght": 10, "changed_date": "2014-09-07T19:53:45.727Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T19:38:55.995Z", "lft": 1, "tree_id": 9, "position": 0, "placeholder": 11, "plugin_type": "TextPlugin"}}]	10
1087	56	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": "", "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 0, "creation_date": "2014-09-02T00:20:41.372Z", "slug": "home", "publisher_public": 2}}]	Home (home, en)
1088	56	9	9	9	json	[{"pk": 9, "model": "cms.placeholder", "fields": {"slot": "creto_content", "default_width": null}}]	creto_content
1089	56	23	23	25	json	[{"pk": 23, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/1/guardiant-truck_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	guardiant-truck_1.png
1090	56	7	7	10	json	[{"pk": 7, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-07T03:34:08.742Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T03:33:14.513Z", "lft": 1, "tree_id": 6, "position": 0, "placeholder": 8, "plugin_type": "CMSGalleryPlugin"}}]	7
1091	56	10	10	31	json	[{"pk": 10, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact us\\" id=\\"plugin_obj_13\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_14\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
1092	56	13	13	10	json	[{"pk": 13, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-09-07T19:53:37.613Z", "parent": 10, "language": "en", "level": 1, "creation_date": "2014-09-07T19:53:34.346Z", "lft": 6, "tree_id": 9, "position": 0, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	13
1093	56	14	14	10	json	[{"pk": 14, "model": "cms.cmsplugin", "fields": {"rght": 9, "changed_date": "2014-09-07T19:53:44.401Z", "parent": 10, "language": "en", "level": 1, "creation_date": "2014-09-07T19:53:41.617Z", "lft": 8, "tree_id": 9, "position": 1, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	14
1094	56	7	7	9	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "mission_content", "default_width": null}}]	mission_content
1095	56	8	8	10	json	[{"pk": 8, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-07T12:45:17.924Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T03:40:27.075Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 9, "plugin_type": "TextPlugin"}}]	8
3492	218	1	1	11	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": "", "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "homepage.html", "tree_id": 1, "placeholders": [2, 3, 6, 7, 8, 9, 10, 11], "changed_date": "2014-09-20T21:22:42.385Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-09-02T00:20:41.416Z", "creation_date": "2014-09-02T00:20:41.259Z", "level": 0, "changed_by": "brandon", "application_urls": "", "xframe_options": 0, "revision_id": 0}}]	Home
3493	218	2	2	9	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3494	218	3	3	9	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3495	218	4	4	31	json	[{"pk": 4, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHO WE ARE</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems is a privately owned company dedicated to serving the needs of the gas \\u0003transmission industry. Guardiant's core principle is to always do the next right thing. Our mission is to be the leading lubrication systems company in this industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHAT WE DO</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems services the gas transmission industry for all it\\u2019s lubrication needs. We sell the finest parts available, service existing systems, design new lubrication systems, and provide state of the art training programs. At Guardiant, we are never satisfied with the way it\\u2019s always been done. We believe stagnation in design is moving backwards.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	WHO WE ARE...
3496	218	6	6	9	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content
3497	218	1	1	34	json	[{"pk": 1, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/homepage_gallery.html", "title": "Home page Gallery"}}]	2 image(s) in gallery
3498	218	8	8	9	json	[{"pk": 8, "model": "cms.placeholder", "fields": {"slot": "quote_content", "default_width": null}}]	quote_content
3499	218	9	9	9	json	[{"pk": 9, "model": "cms.placeholder", "fields": {"slot": "creto_content", "default_width": null}}]	creto_content
3500	218	10	10	9	json	[{"pk": 10, "model": "cms.placeholder", "fields": {"slot": "grid_content", "default_width": null}}]	grid_content
3501	218	11	11	9	json	[{"pk": 11, "model": "cms.placeholder", "fields": {"slot": "help_content", "default_width": null}}]	help_content
3502	218	12	12	28	json	[{"pk": 12, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact Us", "url": "", "page_link": null, "phone": "", "anchor": "", "target": ""}}]	Contact Us
1096	57	3	3	16	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "About Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 3, "published": false, "path": "about-us", "publisher_state": 1, "creation_date": "2014-09-07T23:09:31.805Z", "slug": "about-us", "publisher_public": null}}]	About Us (about-us, en)
1097	57	19	19	9	json	[{"pk": 19, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
1098	57	18	18	9	json	[{"pk": 18, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
1099	57	3	3	11	json	[{"pk": 3, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 3, "placeholders": [18, 19], "changed_date": "2014-09-07T23:09:31.808Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": null, "creation_date": "2014-09-07T23:09:31.722Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	About Us
1100	58	3	3	11	json	[{"pk": 3, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": false, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 3, "placeholders": [18, 19], "changed_date": "2014-09-07T23:09:52.243Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-07T23:09:52.067Z", "creation_date": "2014-09-07T23:09:31.722Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	About Us
1101	58	3	3	16	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "About Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 3, "published": true, "path": "about-us", "publisher_state": 0, "creation_date": "2014-09-07T23:09:31.805Z", "slug": "about-us", "publisher_public": 4}}]	About Us (about-us, en)
1102	58	18	18	9	json	[{"pk": 18, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
1103	58	19	19	9	json	[{"pk": 19, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3876	255	166	166	10	json	[{"pk": 166, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-21T02:31:32.878Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-21T02:31:32.870Z", "lft": 1, "tree_id": 51, "position": 2, "placeholder": 32, "plugin_type": "ContactPlugin"}}]	166
3503	218	13	13	28	json	[{"pk": 13, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
123	13	1	1	11	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": "", "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "homepage.html", "tree_id": 1, "placeholders": [2, 3, 6, 7, 8, 9, 10, 11], "changed_date": "2014-09-07T03:16:06.884Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-09-02T00:20:41.416Z", "creation_date": "2014-09-02T00:20:41.259Z", "level": 0, "changed_by": "brandon", "application_urls": "", "xframe_options": 0, "revision_id": 0}}]	Home
124	13	2	2	9	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
125	13	3	3	9	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
126	13	1	1	34	json	[{"pk": 1, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/homepage_gallery.html", "title": "Home page Gallery"}}]	1 image(s) in gallery
127	13	6	6	9	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content
128	13	7	7	9	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "mission_content", "default_width": null}}]	mission_content
129	13	8	8	9	json	[{"pk": 8, "model": "cms.placeholder", "fields": {"slot": "quote_content", "default_width": null}}]	quote_content
130	13	9	9	9	json	[{"pk": 9, "model": "cms.placeholder", "fields": {"slot": "creto_content", "default_width": null}}]	creto_content
131	13	10	10	9	json	[{"pk": 10, "model": "cms.placeholder", "fields": {"slot": "grid_content", "default_width": null}}]	grid_content
132	13	11	11	9	json	[{"pk": 11, "model": "cms.placeholder", "fields": {"slot": "help_content", "default_width": null}}]	help_content
133	13	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": "", "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 0, "creation_date": "2014-09-02T00:20:41.372Z", "slug": "home", "publisher_public": 2}}]	Home (home, en)
134	13	1	1	10	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-07T02:54:19.601Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T02:10:25.018Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 6, "plugin_type": "CMSGalleryPlugin"}}]	1
135	13	4	4	31	json	[{"pk": 4, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li>\\n\\t<h1>\\u00a0</h1>\\n\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHO WE ARE</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems is a privately owned company dedicated to serving the needs of the gas \\u0003transmission industry. Guardiant's core principle is to always do the next right thing. Our mission is to be the leading lubrication systems company in this industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li>\\n\\t<h1>\\u00a0</h1>\\n\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHAT WE DO</h2>\\n\\t\\t</li>\\n\\t\\t<li>Guardiant Lubrication Systems services the gas transmission industry for all it\\u2019s lubrication needs. We sell the finest parts available, service existing systems, design new lubrication systems, and provide state of the art training programs. At Guardiant, we are never satisfied with the way it\\u2019s always been done. We believe stagnation in design is moving backwards.</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	WHO WE ARE...
136	13	4	4	10	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-07T03:15:47.459Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T03:09:24.910Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	4
3504	218	4	4	10	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:30:52.388Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 2, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	4
3505	218	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": "", "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-09-02T00:20:41.372Z", "slug": "home", "publisher_public": 2}}]	Home (home, en)
3506	218	7	7	9	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "mission_content", "default_width": null}}]	mission_content
3877	255	7	7	11	json	[{"pk": 7, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 7, "placeholders": [32, 33], "changed_date": "2014-09-21T02:19:48.286Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T22:38:35.974Z", "creation_date": "2014-09-14T18:50:32.945Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Contact Us
2785	176	38	38	10	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:47:46.643Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:47:30.733Z", "lft": 1, "tree_id": 22, "position": 3, "placeholder": 34, "plugin_type": "TextPlugin"}}]	38
1173	68	3	3	16	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "About Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 3, "published": true, "path": "about-us", "publisher_state": 0, "creation_date": "2014-09-07T23:09:31.805Z", "slug": "about-us", "publisher_public": 4}}]	About Us (about-us, en)
1174	68	3	3	11	json	[{"pk": 3, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": false, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 3, "placeholders": [18, 19], "changed_date": "2014-09-07T23:15:12.136Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-07T23:09:52.067Z", "creation_date": "2014-09-07T23:09:31.722Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	About Us
1175	68	18	18	9	json	[{"pk": 18, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
1176	68	19	19	9	json	[{"pk": 19, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
1177	68	52	52	31	json	[{"pk": 52, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - about-us_1.png\\" class=\\"bb3\\" id=\\"plugin_obj_53\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
1178	68	53	53	25	json	[{"pk": 53, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/about-us_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	about-us_1.png
1179	68	52	52	10	json	[{"pk": 52, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-07T23:15:07.060Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:12:33.888Z", "lft": 1, "tree_id": 25, "position": 0, "placeholder": 18, "plugin_type": "TextPlugin"}}]	52
1180	68	53	53	10	json	[{"pk": 53, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:12:54.627Z", "parent": 52, "language": "en", "level": 1, "creation_date": "2014-09-07T23:12:42.336Z", "lft": 2, "tree_id": 25, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	53
3878	255	7	7	16	json	[{"pk": 7, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Contact Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 7, "published": true, "path": "contact-us", "publisher_state": 1, "creation_date": "2014-09-14T18:50:33.093Z", "slug": "contact-us", "publisher_public": 11}}]	Contact Us (contact-us, en)
3879	255	85	85	31	json	[{"pk": 85, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - contact-us-banner.jpg\\" id=\\"plugin_obj_86\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
3880	255	86	86	10	json	[{"pk": 86, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T22:38:31.174Z", "parent": 85, "language": "en", "level": 1, "creation_date": "2014-09-14T22:38:15.230Z", "lft": 2, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "PicturePlugin"}}]	86
3881	255	85	85	10	json	[{"pk": 85, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T22:38:31.215Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T22:38:10.897Z", "lft": 1, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "TextPlugin"}}]	85
3507	218	8	8	10	json	[{"pk": 8, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:48:42.335Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:48:23.267Z", "lft": 1, "tree_id": 5, "position": 0, "placeholder": 9, "plugin_type": "TextPlugin"}}]	8
3508	218	1	1	10	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-20T14:33:37.746Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:26:42.874Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 6, "plugin_type": "CMSGalleryPlugin"}}]	1
3882	256	32	32	9	json	[{"pk": 32, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3883	256	33	33	9	json	[{"pk": 33, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2786	176	29	29	10	json	[{"pk": 29, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:43:21.029Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:34:15.847Z", "lft": 1, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "TextPlugin"}}]	29
2787	176	30	30	10	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:43:17.344Z", "parent": 29, "language": "en", "level": 1, "creation_date": "2014-09-14T20:34:22.410Z", "lft": 2, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	30
2788	176	37	37	10	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T20:46:23.347Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 21, "position": 1, "placeholder": 34, "plugin_type": "TextPlugin"}}]	37
2866	182	8	8	11	json	[{"pk": 8, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 8, "placeholders": [34, 35], "changed_date": "2014-09-14T21:00:02.403Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T20:35:41.020Z", "creation_date": "2014-09-14T20:34:02.734Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Services
2867	182	39	39	10	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:47:45.231Z", "parent": 38, "language": "en", "level": 1, "creation_date": "2014-09-14T20:47:36.482Z", "lft": 2, "tree_id": 22, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	39
2868	182	50	50	31	json	[{"pk": 50, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"two-up-blue\\">\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Installation</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>A properly installed lubrication system will eliminate many headaches you will otherwise encounter. In fact, poorly or improperly installed systems are one of the leading causes of system problems. The installation teams at Guardiant are sticklers for getting every detail right.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Stand Alone Lube System</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant builds stand alone lubrication systems that can be set up anywhere, that run independent of any compressor drives, and are designed to fit your specific lubrication needs. The applications for these versatile units are wide open. Anywhere an independant and precision lube source is required.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Installation A properly...
2869	182	29	29	31	json	[{"pk": 29, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - services-banner_1.png\\" id=\\"plugin_obj_30\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2870	182	8	8	16	json	[{"pk": 8, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Services", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 8, "published": true, "path": "services", "publisher_state": 1, "creation_date": "2014-09-14T20:34:02.850Z", "slug": "services", "publisher_public": 9}}]	Services (services, en)
2871	182	50	50	10	json	[{"pk": 50, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T21:00:11.509Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 26, "position": 3, "placeholder": 34, "plugin_type": "TextPlugin"}}]	50
2872	182	30	30	25	json	[{"pk": 30, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/services-banner_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	services-banner_1.png
2873	182	38	38	10	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T21:00:11.527Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:47:30.733Z", "lft": 1, "tree_id": 22, "position": 2, "placeholder": 34, "plugin_type": "TextPlugin"}}]	38
2874	182	29	29	10	json	[{"pk": 29, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T21:00:11.497Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:34:15.847Z", "lft": 1, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "TextPlugin"}}]	29
2875	182	30	30	10	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:43:17.344Z", "parent": 29, "language": "en", "level": 1, "creation_date": "2014-09-14T20:34:22.410Z", "lft": 2, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	30
2876	182	37	37	10	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T21:00:11.519Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 21, "position": 1, "placeholder": 34, "plugin_type": "TextPlugin"}}]	37
2902	184	29	29	10	json	[{"pk": 29, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T21:00:11.497Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:34:15.847Z", "lft": 1, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "TextPlugin"}}]	29
3020	192	40	40	9	json	[{"pk": 40, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3884	256	86	86	10	json	[{"pk": 86, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T22:38:31.174Z", "parent": 85, "language": "en", "level": 1, "creation_date": "2014-09-14T22:38:15.230Z", "lft": 2, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "PicturePlugin"}}]	86
1866	108	52	52	31	json	[{"pk": 52, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - about-us_1.png\\" id=\\"plugin_obj_53\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>"}}]	
3509	218	11	11	10	json	[{"pk": 11, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-14T19:59:31.307Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:51:07.209Z", "lft": 1, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "TextPlugin"}}]	11
3510	218	12	12	10	json	[{"pk": 12, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T19:59:14.136Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:58:57.858Z", "lft": 2, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	12
3511	218	13	13	10	json	[{"pk": 13, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-14T19:59:29.618Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:59:18.874Z", "lft": 4, "tree_id": 6, "position": 1, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	13
3512	218	11	11	31	json	[{"pk": 11, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact Us\\" id=\\"plugin_obj_12\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_13\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
3513	218	8	8	31	json	[{"pk": 8, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li>\\n\\t<ul>\\n\\t\\t<li class=\\"title\\">Our Leadership</li>\\n\\t\\t<li class=\\"meaning\\">The leadership at Guardiant is headed up by Scott Roys who brings the same innovative and customer centric philosophy that he learned from his father Curtis Roys at CCT. The entire staff is peppered with familiar faces that will remind many people of the way lubrication system services have been and should be run!</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Our Leadership The...
3809	248	162	162	39	json	[{"pk": 162, "model": "cmsplugin_contact.contact", "fields": {"form_layout": "cmsplugin_contact.forms.ContactForm", "recaptcha_theme": "clean", "site_email": "blorenz@gmail.com", "spam_protection_method": 0, "submit": "Submit", "thanks": "", "redirect_url": "", "form_name": "Something", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	blorenz@gmail.com
3810	248	163	163	46	json	[{"pk": 163, "model": "cmsplugin_guardiant_contact.guardiantcontact", "fields": {"form_layout": "cmsplugin_contact.forms.ContactForm", "recaptcha_theme": "clean", "site_email": "blorenz@gmail.com", "spam_protection_method": 0, "submit": "Submit", "thanks": "", "redirect_url": "", "form_name": "guardiant", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	blorenz@gmail.com
3811	248	86	86	25	json	[{"pk": 86, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/7/contact-us-banner.jpg", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	contact-us-banner.jpg
3812	248	7	7	11	json	[{"pk": 7, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 7, "placeholders": [32, 33], "changed_date": "2014-09-21T02:05:55.710Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T22:38:35.974Z", "creation_date": "2014-09-14T18:50:32.945Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Contact Us
3813	248	7	7	16	json	[{"pk": 7, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Contact Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 7, "published": true, "path": "contact-us", "publisher_state": 1, "creation_date": "2014-09-14T18:50:33.093Z", "slug": "contact-us", "publisher_public": 11}}]	Contact Us (contact-us, en)
3814	248	162	162	10	json	[{"pk": 162, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-21T01:42:07.680Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-21T01:41:16.863Z", "lft": 1, "tree_id": 51, "position": 2, "placeholder": 32, "plugin_type": "ContactPlugin"}}]	162
3815	248	163	163	10	json	[{"pk": 163, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-21T02:06:09.227Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-21T02:05:55.611Z", "lft": 1, "tree_id": 52, "position": 3, "placeholder": 32, "plugin_type": "GuardiantContactPlugin"}}]	163
3816	248	85	85	31	json	[{"pk": 85, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - contact-us-banner.jpg\\" id=\\"plugin_obj_86\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
3817	248	86	86	10	json	[{"pk": 86, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T22:38:31.174Z", "parent": 85, "language": "en", "level": 1, "creation_date": "2014-09-14T22:38:15.230Z", "lft": 2, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "PicturePlugin"}}]	86
3818	248	85	85	10	json	[{"pk": 85, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T22:38:31.215Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T22:38:10.897Z", "lft": 1, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "TextPlugin"}}]	85
3885	256	7	7	11	json	[{"pk": 7, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 7, "placeholders": [32, 33], "changed_date": "2014-09-21T02:31:39.908Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T22:38:35.974Z", "creation_date": "2014-09-14T18:50:32.945Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Contact Us
3886	256	7	7	16	json	[{"pk": 7, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Contact Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 7, "published": true, "path": "contact-us", "publisher_state": 1, "creation_date": "2014-09-14T18:50:33.093Z", "slug": "contact-us", "publisher_public": 11}}]	Contact Us (contact-us, en)
2542	149	3	3	11	json	[{"pk": 3, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": false, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "template_1.html", "tree_id": 2, "placeholders": [18, 19], "changed_date": "2014-09-08T01:24:09.881Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-07T23:09:52.067Z", "creation_date": "2014-09-07T23:09:31.722Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	About Us
2543	149	3	3	16	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "About Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 3, "published": true, "path": "about-us", "publisher_state": 1, "creation_date": "2014-09-07T23:09:31.805Z", "slug": "about-us", "publisher_public": 4}}]	About Us (about-us, en)
2544	149	18	18	9	json	[{"pk": 18, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2545	149	19	19	9	json	[{"pk": 19, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2546	149	14	14	10	json	[{"pk": 14, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T20:04:34.306Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:04:34.300Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 18, "plugin_type": "TextPlugin"}}]	14
2789	177	34	34	9	json	[{"pk": 34, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2790	177	35	35	9	json	[{"pk": 35, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3819	249	32	32	9	json	[{"pk": 32, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3820	249	33	33	9	json	[{"pk": 33, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3821	249	163	163	46	json	[{"pk": 163, "model": "cmsplugin_guardiant_contact.guardiantcontact", "fields": {"form_layout": "cmsplugin_contact.forms.ContactForm", "recaptcha_theme": "clean", "site_email": "blorenz@gmail.com", "spam_protection_method": 0, "submit": "Submit", "thanks": "", "redirect_url": "", "form_name": "guardiant", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	blorenz@gmail.com
3822	249	86	86	25	json	[{"pk": 86, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/7/contact-us-banner.jpg", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	contact-us-banner.jpg
3823	249	7	7	11	json	[{"pk": 7, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 7, "placeholders": [32, 33], "changed_date": "2014-09-21T02:08:20.586Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T22:38:35.974Z", "creation_date": "2014-09-14T18:50:32.945Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Contact Us
3824	249	7	7	16	json	[{"pk": 7, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Contact Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 7, "published": true, "path": "contact-us", "publisher_state": 1, "creation_date": "2014-09-14T18:50:33.093Z", "slug": "contact-us", "publisher_public": 11}}]	Contact Us (contact-us, en)
3825	249	163	163	10	json	[{"pk": 163, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-21T02:08:20.538Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-21T02:05:55.611Z", "lft": 1, "tree_id": 52, "position": 1, "placeholder": 32, "plugin_type": "GuardiantContactPlugin"}}]	163
3826	249	85	85	31	json	[{"pk": 85, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - contact-us-banner.jpg\\" id=\\"plugin_obj_86\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
3827	249	86	86	10	json	[{"pk": 86, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T22:38:31.174Z", "parent": 85, "language": "en", "level": 1, "creation_date": "2014-09-14T22:38:15.230Z", "lft": 2, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "PicturePlugin"}}]	86
3828	249	85	85	10	json	[{"pk": 85, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T22:38:31.215Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T22:38:10.897Z", "lft": 1, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "TextPlugin"}}]	85
3829	250	32	32	9	json	[{"pk": 32, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3830	250	33	33	9	json	[{"pk": 33, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3831	250	86	86	10	json	[{"pk": 86, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T22:38:31.174Z", "parent": 85, "language": "en", "level": 1, "creation_date": "2014-09-14T22:38:15.230Z", "lft": 2, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "PicturePlugin"}}]	86
3832	250	7	7	11	json	[{"pk": 7, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 7, "placeholders": [32, 33], "changed_date": "2014-09-21T02:10:50.834Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T22:38:35.974Z", "creation_date": "2014-09-14T18:50:32.945Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Contact Us
3833	250	7	7	16	json	[{"pk": 7, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Contact Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 7, "published": true, "path": "contact-us", "publisher_state": 1, "creation_date": "2014-09-14T18:50:33.093Z", "slug": "contact-us", "publisher_public": 11}}]	Contact Us (contact-us, en)
3887	256	85	85	31	json	[{"pk": 85, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - contact-us-banner.jpg\\" id=\\"plugin_obj_86\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
3888	256	86	86	25	json	[{"pk": 86, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/7/contact-us-banner.jpg", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	contact-us-banner.jpg
3889	256	85	85	10	json	[{"pk": 85, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T22:38:31.215Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T22:38:10.897Z", "lft": 1, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "TextPlugin"}}]	85
3834	250	85	85	31	json	[{"pk": 85, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - contact-us-banner.jpg\\" id=\\"plugin_obj_86\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
3835	250	86	86	25	json	[{"pk": 86, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/7/contact-us-banner.jpg", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	contact-us-banner.jpg
3836	250	85	85	10	json	[{"pk": 85, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T22:38:31.215Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T22:38:10.897Z", "lft": 1, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "TextPlugin"}}]	85
3536	220	1	1	11	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": "", "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "homepage.html", "tree_id": 1, "placeholders": [2, 3, 6, 7, 8, 9, 10, 11], "changed_date": "2014-09-20T21:22:58.667Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-09-02T00:20:41.416Z", "creation_date": "2014-09-02T00:20:41.259Z", "level": 0, "changed_by": "brandon", "application_urls": "", "xframe_options": 0, "revision_id": 0}}]	Home
3537	220	2	2	9	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3538	220	3	3	9	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3539	220	4	4	31	json	[{"pk": 4, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHO WE ARE</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems is a privately owned company dedicated to serving the needs of the gas \\u0003transmission industry. Guardiant's core principle is to always do the next right thing. Our mission is to be the leading lubrication systems company in this industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHAT WE DO</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems services the gas transmission industry for all it\\u2019s lubrication needs. We sell the finest parts available, service existing systems, design new lubrication systems, and provide state of the art training programs. At Guardiant, we are never satisfied with the way it\\u2019s always been done. We believe stagnation in design is moving backwards.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	WHO WE ARE...
3540	220	6	6	9	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content
3541	220	7	7	9	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "mission_content", "default_width": null}}]	mission_content
3542	220	8	8	9	json	[{"pk": 8, "model": "cms.placeholder", "fields": {"slot": "quote_content", "default_width": null}}]	quote_content
3543	220	9	9	9	json	[{"pk": 9, "model": "cms.placeholder", "fields": {"slot": "creto_content", "default_width": null}}]	creto_content
3544	220	10	10	9	json	[{"pk": 10, "model": "cms.placeholder", "fields": {"slot": "grid_content", "default_width": null}}]	grid_content
3545	220	11	11	9	json	[{"pk": 11, "model": "cms.placeholder", "fields": {"slot": "help_content", "default_width": null}}]	help_content
3546	220	12	12	28	json	[{"pk": 12, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact Us", "url": "", "page_link": null, "phone": "", "anchor": "", "target": ""}}]	Contact Us
3547	220	13	13	28	json	[{"pk": 13, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
3548	220	12	12	10	json	[{"pk": 12, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T19:59:14.136Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:58:57.858Z", "lft": 2, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	12
3549	220	8	8	10	json	[{"pk": 8, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:48:42.335Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:48:23.267Z", "lft": 1, "tree_id": 5, "position": 0, "placeholder": 9, "plugin_type": "TextPlugin"}}]	8
3550	220	11	11	10	json	[{"pk": 11, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-14T19:59:31.307Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:51:07.209Z", "lft": 1, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "TextPlugin"}}]	11
3551	220	11	11	31	json	[{"pk": 11, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact Us\\" id=\\"plugin_obj_12\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_13\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
3552	220	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": "", "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-09-02T00:20:41.372Z", "slug": "home", "publisher_public": 2}}]	Home (home, en)
2547	150	19	19	9	json	[{"pk": 19, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2548	150	3	3	11	json	[{"pk": 3, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": false, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "template_1.html", "tree_id": 2, "placeholders": [18, 19], "changed_date": "2014-09-14T20:04:34.376Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-07T23:09:52.067Z", "creation_date": "2014-09-07T23:09:31.722Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	About Us
2549	150	14	14	31	json	[{"pk": 14, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - about-us_1.png\\" id=\\"plugin_obj_72\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture - about-us_1.png\\"></p>"}}]	
2550	150	18	18	9	json	[{"pk": 18, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2551	150	3	3	16	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "About Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 3, "published": true, "path": "about-us", "publisher_state": 1, "creation_date": "2014-09-07T23:09:31.805Z", "slug": "about-us", "publisher_public": 4}}]	About Us (about-us, en)
3890	257	32	32	9	json	[{"pk": 32, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3891	257	33	33	9	json	[{"pk": 33, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3892	257	86	86	25	json	[{"pk": 86, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/7/contact-us-banner.jpg", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	contact-us-banner.jpg
3893	257	167	167	10	json	[{"pk": 167, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-21T02:34:43.966Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-21T02:34:43.957Z", "lft": 1, "tree_id": 51, "position": 2, "placeholder": 32, "plugin_type": "ContactPlugin"}}]	167
3894	257	7	7	11	json	[{"pk": 7, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 7, "placeholders": [32, 33], "changed_date": "2014-09-21T02:31:39.978Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T22:38:35.974Z", "creation_date": "2014-09-14T18:50:32.945Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Contact Us
3895	257	85	85	31	json	[{"pk": 85, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - contact-us-banner.jpg\\" id=\\"plugin_obj_86\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
3896	257	86	86	10	json	[{"pk": 86, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T22:38:31.174Z", "parent": 85, "language": "en", "level": 1, "creation_date": "2014-09-14T22:38:15.230Z", "lft": 2, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "PicturePlugin"}}]	86
3897	257	7	7	16	json	[{"pk": 7, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Contact Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 7, "published": true, "path": "contact-us", "publisher_state": 1, "creation_date": "2014-09-14T18:50:33.093Z", "slug": "contact-us", "publisher_public": 11}}]	Contact Us (contact-us, en)
3898	257	85	85	10	json	[{"pk": 85, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T22:38:31.215Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T22:38:10.897Z", "lft": 1, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "TextPlugin"}}]	85
3899	258	32	32	9	json	[{"pk": 32, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3900	258	33	33	9	json	[{"pk": 33, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3901	258	86	86	25	json	[{"pk": 86, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/7/contact-us-banner.jpg", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	contact-us-banner.jpg
3902	258	167	167	39	json	[{"pk": 167, "model": "cmsplugin_contact.contact", "fields": {"form_layout": "guardiant.forms.GuardiantContactForm", "recaptcha_theme": "clean", "site_email": "blorenz@gmail.com", "spam_protection_method": 0, "submit": "Submit", "thanks": "", "redirect_url": "", "form_name": "sdfsdf", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	blorenz@gmail.com
3903	258	7	7	11	json	[{"pk": 7, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 7, "placeholders": [32, 33], "changed_date": "2014-09-21T02:34:44.082Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T22:38:35.974Z", "creation_date": "2014-09-14T18:50:32.945Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Contact Us
3904	258	85	85	31	json	[{"pk": 85, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - contact-us-banner.jpg\\" id=\\"plugin_obj_86\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
3905	258	86	86	10	json	[{"pk": 86, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T22:38:31.174Z", "parent": 85, "language": "en", "level": 1, "creation_date": "2014-09-14T22:38:15.230Z", "lft": 2, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "PicturePlugin"}}]	86
3906	258	7	7	16	json	[{"pk": 7, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Contact Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 7, "published": true, "path": "contact-us", "publisher_state": 1, "creation_date": "2014-09-14T18:50:33.093Z", "slug": "contact-us", "publisher_public": 11}}]	Contact Us (contact-us, en)
3907	258	167	167	10	json	[{"pk": 167, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-21T02:34:57.255Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-21T02:34:43.957Z", "lft": 1, "tree_id": 51, "position": 2, "placeholder": 32, "plugin_type": "ContactPlugin"}}]	167
3908	258	85	85	10	json	[{"pk": 85, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T22:38:31.215Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T22:38:10.897Z", "lft": 1, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "TextPlugin"}}]	85
3909	259	1	1	11	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": "", "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "homepage.html", "tree_id": 1, "placeholders": [2, 3, 6, 7, 8, 9, 10, 11], "changed_date": "2014-09-21T02:34:57.395Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-09-02T00:20:41.416Z", "creation_date": "2014-09-02T00:20:41.259Z", "level": 0, "changed_by": "brandon", "application_urls": "", "xframe_options": 0, "revision_id": 0}}]	Home
3910	259	2	2	9	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2552	150	14	14	10	json	[{"pk": 14, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T20:04:49.890Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:04:34.300Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 18, "plugin_type": "TextPlugin"}}]	14
3911	259	3	3	9	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2553	151	3	3	16	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "About Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 3, "published": true, "path": "about-us", "publisher_state": 1, "creation_date": "2014-09-07T23:09:31.805Z", "slug": "about-us", "publisher_public": 4}}]	About Us (about-us, en)
2554	151	3	3	11	json	[{"pk": 3, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": false, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "template_1.html", "tree_id": 2, "placeholders": [18, 19], "changed_date": "2014-09-14T20:04:50.016Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-07T23:09:52.067Z", "creation_date": "2014-09-07T23:09:31.722Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	About Us
2555	151	14	14	31	json	[{"pk": 14, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - about-us_1.png\\" id=\\"plugin_obj_72\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture - about-us_1.png\\"></p>"}}]	
2556	151	15	15	10	json	[{"pk": 15, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:05:20.086Z", "parent": 14, "language": "en", "level": 1, "creation_date": "2014-09-14T20:05:20.070Z", "lft": 2, "tree_id": 7, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	15
2557	151	18	18	9	json	[{"pk": 18, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2558	151	19	19	9	json	[{"pk": 19, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2559	151	14	14	10	json	[{"pk": 14, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:04:49.890Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:04:34.300Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 18, "plugin_type": "TextPlugin"}}]	14
2560	152	3	3	16	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "About Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 3, "published": true, "path": "about-us", "publisher_state": 1, "creation_date": "2014-09-07T23:09:31.805Z", "slug": "about-us", "publisher_public": 4}}]	About Us (about-us, en)
2561	152	3	3	11	json	[{"pk": 3, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": false, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "template_1.html", "tree_id": 2, "placeholders": [18, 19], "changed_date": "2014-09-14T20:05:20.184Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-07T23:09:52.067Z", "creation_date": "2014-09-07T23:09:31.722Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	About Us
2562	152	14	14	31	json	[{"pk": 14, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - about-us_1.png\\" id=\\"plugin_obj_72\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture - about-us_1.png\\"></p>"}}]	
2563	152	15	15	25	json	[{"pk": 15, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/about-us_2.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	about-us_2.png
841	47	13	13	10	json	[{"pk": 13, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-09-07T19:53:37.613Z", "parent": 10, "language": "en", "level": 1, "creation_date": "2014-09-07T19:53:34.346Z", "lft": 6, "tree_id": 9, "position": 0, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	13
842	47	14	14	10	json	[{"pk": 14, "model": "cms.cmsplugin", "fields": {"rght": 9, "changed_date": "2014-09-07T19:53:44.401Z", "parent": 10, "language": "en", "level": 1, "creation_date": "2014-09-07T19:53:41.617Z", "lft": 8, "tree_id": 9, "position": 1, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	14
843	47	7	7	34	json	[{"pk": 7, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/quote_gallery.html", "title": "Quote Gallery"}}]	1 image(s) in gallery
844	47	8	8	10	json	[{"pk": 8, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-07T12:45:17.924Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T03:40:27.075Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 9, "plugin_type": "TextPlugin"}}]	8
2564	152	18	18	9	json	[{"pk": 18, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2565	152	19	19	9	json	[{"pk": 19, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2566	152	14	14	10	json	[{"pk": 14, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:04:49.890Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:04:34.300Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 18, "plugin_type": "TextPlugin"}}]	14
2567	152	15	15	10	json	[{"pk": 15, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:06:11.327Z", "parent": 14, "language": "en", "level": 1, "creation_date": "2014-09-14T20:05:20.070Z", "lft": 2, "tree_id": 7, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	15
2568	153	3	3	16	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "About Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 3, "published": true, "path": "about-us", "publisher_state": 1, "creation_date": "2014-09-07T23:09:31.805Z", "slug": "about-us", "publisher_public": 4}}]	About Us (about-us, en)
2877	183	34	34	9	json	[{"pk": 34, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2878	183	35	35	9	json	[{"pk": 35, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3912	259	4	4	31	json	[{"pk": 4, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHO WE ARE</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems is a privately owned company dedicated to serving the needs of the gas \\u0003transmission industry. Guardiant's core principle is to always do the next right thing. Our mission is to be the leading lubrication systems company in this industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHAT WE DO</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems services the gas transmission industry for all it\\u2019s lubrication needs. We sell the finest parts available, service existing systems, design new lubrication systems, and provide state of the art training programs. At Guardiant, we are never satisfied with the way it\\u2019s always been done. We believe stagnation in design is moving backwards.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	WHO WE ARE...
3913	259	6	6	9	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content
3914	259	7	7	9	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "mission_content", "default_width": null}}]	mission_content
3915	259	8	8	9	json	[{"pk": 8, "model": "cms.placeholder", "fields": {"slot": "quote_content", "default_width": null}}]	quote_content
3916	259	9	9	9	json	[{"pk": 9, "model": "cms.placeholder", "fields": {"slot": "creto_content", "default_width": null}}]	creto_content
3917	259	10	10	9	json	[{"pk": 10, "model": "cms.placeholder", "fields": {"slot": "grid_content", "default_width": null}}]	grid_content
3918	259	11	11	9	json	[{"pk": 11, "model": "cms.placeholder", "fields": {"slot": "help_content", "default_width": null}}]	help_content
3919	259	12	12	28	json	[{"pk": 12, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact Us", "url": "", "page_link": null, "phone": "", "anchor": "", "target": ""}}]	Contact Us
3920	259	13	13	28	json	[{"pk": 13, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
3921	259	12	12	10	json	[{"pk": 12, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T19:59:14.136Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:58:57.858Z", "lft": 2, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	12
3922	259	8	8	10	json	[{"pk": 8, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:48:42.335Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:48:23.267Z", "lft": 1, "tree_id": 5, "position": 0, "placeholder": 9, "plugin_type": "TextPlugin"}}]	8
3923	259	11	11	10	json	[{"pk": 11, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-14T19:59:31.307Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:51:07.209Z", "lft": 1, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "TextPlugin"}}]	11
3924	259	11	11	31	json	[{"pk": 11, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact Us\\" id=\\"plugin_obj_12\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_13\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
3925	259	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": "", "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-09-02T00:20:41.372Z", "slug": "home", "publisher_public": 2}}]	Home (home, en)
3926	259	8	8	31	json	[{"pk": 8, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li>\\n\\t<ul>\\n\\t\\t<li class=\\"title\\">Our Leadership</li>\\n\\t\\t<li class=\\"meaning\\">The leadership at Guardiant is headed up by Scott Roys who brings the same innovative and customer centric philosophy that he learned from his father Curtis Roys at CCT. The entire staff is peppered with familiar faces that will remind many people of the way lubrication system services have been and should be run!</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Our Leadership The...
3927	259	4	4	10	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:30:52.388Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 2, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	4
3928	259	168	168	10	json	[{"pk": 168, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-23T21:57:50.282Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-23T21:57:50.267Z", "lft": 1, "tree_id": 52, "position": 0, "placeholder": 6, "plugin_type": "CMSGalleryPlugin"}}]	168
3929	259	13	13	10	json	[{"pk": 13, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-14T19:59:29.618Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:59:18.874Z", "lft": 4, "tree_id": 6, "position": 1, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	13
2569	153	3	3	11	json	[{"pk": 3, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": false, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "template_1.html", "tree_id": 2, "placeholders": [18, 19], "changed_date": "2014-09-14T20:06:11.593Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-07T23:09:52.067Z", "creation_date": "2014-09-07T23:09:31.722Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	About Us
2570	153	14	14	31	json	[{"pk": 14, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - about-us_2.png\\" id=\\"plugin_obj_15\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2571	153	15	15	25	json	[{"pk": 15, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/about-us_2.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	about-us_2.png
928	51	1	1	11	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": "", "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "homepage.html", "tree_id": 1, "placeholders": [2, 3, 6, 7, 8, 9, 10, 11], "changed_date": "2014-09-07T20:14:33.623Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-09-02T00:20:41.416Z", "creation_date": "2014-09-02T00:20:41.259Z", "level": 0, "changed_by": "brandon", "application_urls": "", "xframe_options": 0, "revision_id": 0}}]	Home
929	51	2	2	9	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
930	51	3	3	9	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
931	51	4	4	31	json	[{"pk": 4, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHO WE ARE</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems is a privately owned company dedicated to serving the needs of the gas \\u0003transmission industry. Guardiant's core principle is to always do the next right thing. Our mission is to be the leading lubrication systems company in this industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHAT WE DO</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems services the gas transmission industry for all it\\u2019s lubrication needs. We sell the finest parts available, service existing systems, design new lubrication systems, and provide state of the art training programs. At Guardiant, we are never satisfied with the way it\\u2019s always been done. We believe stagnation in design is moving backwards.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	WHO WE ARE...
932	51	6	6	9	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content
933	51	1	1	34	json	[{"pk": 1, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/homepage_gallery.html", "title": "Home page Gallery"}}]	1 image(s) in gallery
934	51	8	8	9	json	[{"pk": 8, "model": "cms.placeholder", "fields": {"slot": "quote_content", "default_width": null}}]	quote_content
935	51	9	9	10	json	[{"pk": 9, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-07T19:11:47.714Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T03:46:32.322Z", "lft": 1, "tree_id": 8, "position": 0, "placeholder": 10, "plugin_type": "CMSGalleryPlugin"}}]	9
936	51	10	10	9	json	[{"pk": 10, "model": "cms.placeholder", "fields": {"slot": "grid_content", "default_width": null}}]	grid_content
937	51	11	11	9	json	[{"pk": 11, "model": "cms.placeholder", "fields": {"slot": "help_content", "default_width": null}}]	help_content
938	51	13	13	28	json	[{"pk": 13, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact us", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Contact us
939	51	14	14	28	json	[{"pk": 14, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
940	51	9	9	34	json	[{"pk": 9, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/grid_gallery.html", "title": "Grid Gallery"}}]	5 image(s) in gallery
941	51	23	23	10	json	[{"pk": 23, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-07T20:14:19.268Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T20:13:21.199Z", "lft": 1, "tree_id": 16, "position": 3, "placeholder": 11, "plugin_type": "PicturePlugin"}}]	23
942	51	4	4	10	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-07T03:21:56.484Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T03:09:24.910Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	4
943	51	1	1	10	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-07T02:54:19.601Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T02:10:25.018Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 6, "plugin_type": "CMSGalleryPlugin"}}]	1
944	51	7	7	34	json	[{"pk": 7, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/quote_gallery.html", "title": "Quote Gallery"}}]	1 image(s) in gallery
945	51	8	8	31	json	[{"pk": 8, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li>\\n\\t<ul>\\n\\t\\t<li class=\\"title\\">Our Leadership</li>\\n\\t\\t<li class=\\"meaning\\">The leadership at Guardiant is headed up by Scott Roys who brings the same innovative and customer centric philosophy that he learned from his father Curtis Roys at CCT. The entire staff is peppered with familiar faces that will remind many people of the way lubrication system services have been and should be run!</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Our Leadership The...
3930	260	1	1	11	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": "", "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "homepage.html", "tree_id": 1, "placeholders": [2, 3, 6, 7, 8, 9, 10, 11], "changed_date": "2014-09-23T22:02:02.760Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-09-02T00:20:41.416Z", "creation_date": "2014-09-02T00:20:41.259Z", "level": 0, "changed_by": "brandon", "application_urls": "", "xframe_options": 0, "revision_id": 0}}]	Home
3931	260	2	2	9	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3932	260	3	3	9	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3933	260	4	4	31	json	[{"pk": 4, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHO WE ARE</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems is a privately owned company dedicated to serving the needs of the gas \\u0003transmission industry. Guardiant's core principle is to always do the next right thing. Our mission is to be the leading lubrication systems company in this industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHAT WE DO</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems services the gas transmission industry for all it\\u2019s lubrication needs. We sell the finest parts available, service existing systems, design new lubrication systems, and provide state of the art training programs. At Guardiant, we are never satisfied with the way it\\u2019s always been done. We believe stagnation in design is moving backwards.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	WHO WE ARE...
3934	260	6	6	9	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content
3935	260	7	7	9	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "mission_content", "default_width": null}}]	mission_content
3936	260	8	8	9	json	[{"pk": 8, "model": "cms.placeholder", "fields": {"slot": "quote_content", "default_width": null}}]	quote_content
3937	260	9	9	9	json	[{"pk": 9, "model": "cms.placeholder", "fields": {"slot": "creto_content", "default_width": null}}]	creto_content
3938	260	10	10	9	json	[{"pk": 10, "model": "cms.placeholder", "fields": {"slot": "grid_content", "default_width": null}}]	grid_content
3939	260	11	11	9	json	[{"pk": 11, "model": "cms.placeholder", "fields": {"slot": "help_content", "default_width": null}}]	help_content
3940	260	12	12	28	json	[{"pk": 12, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact Us", "url": "", "page_link": null, "phone": "", "anchor": "", "target": ""}}]	Contact Us
3941	260	13	13	28	json	[{"pk": 13, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
3942	260	12	12	10	json	[{"pk": 12, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T19:59:14.136Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:58:57.858Z", "lft": 2, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	12
3943	260	8	8	10	json	[{"pk": 8, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:48:42.335Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:48:23.267Z", "lft": 1, "tree_id": 5, "position": 0, "placeholder": 9, "plugin_type": "TextPlugin"}}]	8
3944	260	11	11	10	json	[{"pk": 11, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-14T19:59:31.307Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:51:07.209Z", "lft": 1, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "TextPlugin"}}]	11
3945	260	11	11	31	json	[{"pk": 11, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact Us\\" id=\\"plugin_obj_12\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_13\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
3946	260	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": "", "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-09-02T00:20:41.372Z", "slug": "home", "publisher_public": 2}}]	Home (home, en)
3947	260	8	8	31	json	[{"pk": 8, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li>\\n\\t<ul>\\n\\t\\t<li class=\\"title\\">Our Leadership</li>\\n\\t\\t<li class=\\"meaning\\">The leadership at Guardiant is headed up by Scott Roys who brings the same innovative and customer centric philosophy that he learned from his father Curtis Roys at CCT. The entire staff is peppered with familiar faces that will remind many people of the way lubrication system services have been and should be run!</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Our Leadership The...
3948	260	4	4	10	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:30:52.388Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 2, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	4
3949	260	13	13	10	json	[{"pk": 13, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-14T19:59:29.618Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:59:18.874Z", "lft": 4, "tree_id": 6, "position": 1, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	13
2572	153	18	18	9	json	[{"pk": 18, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2573	153	19	19	9	json	[{"pk": 19, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3950	261	1	1	11	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": "", "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "homepage.html", "tree_id": 1, "placeholders": [2, 3, 6, 7, 8, 9, 10, 11], "changed_date": "2014-09-23T22:02:02.876Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-09-02T00:20:41.416Z", "creation_date": "2014-09-02T00:20:41.259Z", "level": 0, "changed_by": "brandon", "application_urls": "", "xframe_options": 0, "revision_id": 0}}]	Home
3951	261	2	2	9	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3952	261	3	3	9	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2574	153	14	14	10	json	[{"pk": 14, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:06:13.191Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:04:34.300Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 18, "plugin_type": "TextPlugin"}}]	14
2575	153	15	15	10	json	[{"pk": 15, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:06:11.327Z", "parent": 14, "language": "en", "level": 1, "creation_date": "2014-09-14T20:05:20.070Z", "lft": 2, "tree_id": 7, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	15
946	51	10	10	10	json	[{"pk": 10, "model": "cms.cmsplugin", "fields": {"rght": 10, "changed_date": "2014-09-07T19:53:45.727Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T19:38:55.995Z", "lft": 1, "tree_id": 9, "position": 0, "placeholder": 11, "plugin_type": "TextPlugin"}}]	10
947	51	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": "", "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 0, "creation_date": "2014-09-02T00:20:41.372Z", "slug": "home", "publisher_public": 2}}]	Home (home, en)
948	51	9	9	9	json	[{"pk": 9, "model": "cms.placeholder", "fields": {"slot": "creto_content", "default_width": null}}]	creto_content
949	51	23	23	25	json	[{"pk": 23, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/1/guardiant-truck.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	guardiant-truck.png
950	51	7	7	10	json	[{"pk": 7, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-07T03:34:08.742Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T03:33:14.513Z", "lft": 1, "tree_id": 6, "position": 0, "placeholder": 8, "plugin_type": "CMSGalleryPlugin"}}]	7
951	51	10	10	31	json	[{"pk": 10, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact us\\" id=\\"plugin_obj_13\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_14\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
952	51	13	13	10	json	[{"pk": 13, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-09-07T19:53:37.613Z", "parent": 10, "language": "en", "level": 1, "creation_date": "2014-09-07T19:53:34.346Z", "lft": 6, "tree_id": 9, "position": 0, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	13
953	51	14	14	10	json	[{"pk": 14, "model": "cms.cmsplugin", "fields": {"rght": 9, "changed_date": "2014-09-07T19:53:44.401Z", "parent": 10, "language": "en", "level": 1, "creation_date": "2014-09-07T19:53:41.617Z", "lft": 8, "tree_id": 9, "position": 1, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	14
954	51	7	7	9	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "mission_content", "default_width": null}}]	mission_content
955	51	8	8	10	json	[{"pk": 8, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-07T12:45:17.924Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T03:40:27.075Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 9, "plugin_type": "TextPlugin"}}]	8
3953	261	4	4	31	json	[{"pk": 4, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHO WE ARE</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems is a privately owned company dedicated to serving the needs of the gas \\u0003transmission industry. Guardiant's core principle is to always do the next right thing. Our mission is to be the leading lubrication systems company in this industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHAT WE DO</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems services the gas transmission industry for all it\\u2019s lubrication needs. We sell the finest parts available, service existing systems, design new lubrication systems, and provide state of the art training programs. At Guardiant, we are never satisfied with the way it\\u2019s always been done. We believe stagnation in design is moving backwards.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	WHO WE ARE...
3954	261	6	6	9	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content
2903	184	8	8	16	json	[{"pk": 8, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Services", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 8, "published": true, "path": "services", "publisher_state": 1, "creation_date": "2014-09-14T20:34:02.850Z", "slug": "services", "publisher_public": 9}}]	Services (services, en)
3025	193	83	83	25	json	[{"pk": 83, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/10/distributors-banner.jpg", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	distributors-banner.jpg
3955	261	7	7	9	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "mission_content", "default_width": null}}]	mission_content
3956	261	8	8	9	json	[{"pk": 8, "model": "cms.placeholder", "fields": {"slot": "quote_content", "default_width": null}}]	quote_content
3957	261	9	9	9	json	[{"pk": 9, "model": "cms.placeholder", "fields": {"slot": "creto_content", "default_width": null}}]	creto_content
3837	251	32	32	9	json	[{"pk": 32, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3838	251	33	33	9	json	[{"pk": 33, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3839	251	164	164	10	json	[{"pk": 164, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-21T02:10:58.109Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-21T02:10:57.826Z", "lft": 1, "tree_id": 51, "position": 2, "placeholder": 32, "plugin_type": "GuardiantContactPlugin"}}]	164
3840	251	86	86	25	json	[{"pk": 86, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/7/contact-us-banner.jpg", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	contact-us-banner.jpg
2621	158	8	8	11	json	[{"pk": 8, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 8, "placeholders": [34, 35], "changed_date": "2014-09-14T20:34:02.853Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": null, "creation_date": "2014-09-14T20:34:02.734Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Services
2622	158	8	8	16	json	[{"pk": 8, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Services", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 8, "published": false, "path": "services", "publisher_state": 1, "creation_date": "2014-09-14T20:34:02.850Z", "slug": "services", "publisher_public": null}}]	Services (services, en)
2623	158	34	34	9	json	[{"pk": 34, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2624	158	35	35	9	json	[{"pk": 35, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3553	220	8	8	31	json	[{"pk": 8, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li>\\n\\t<ul>\\n\\t\\t<li class=\\"title\\">Our Leadership</li>\\n\\t\\t<li class=\\"meaning\\">The leadership at Guardiant is headed up by Scott Roys who brings the same innovative and customer centric philosophy that he learned from his father Curtis Roys at CCT. The entire staff is peppered with familiar faces that will remind many people of the way lubrication system services have been and should be run!</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Our Leadership The...
3554	220	4	4	10	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:30:52.388Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 2, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	4
3555	220	13	13	10	json	[{"pk": 13, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-14T19:59:29.618Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:59:18.874Z", "lft": 4, "tree_id": 6, "position": 1, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	13
3841	251	7	7	11	json	[{"pk": 7, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 7, "placeholders": [32, 33], "changed_date": "2014-09-21T02:10:50.959Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T22:38:35.974Z", "creation_date": "2014-09-14T18:50:32.945Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Contact Us
3842	251	7	7	16	json	[{"pk": 7, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Contact Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 7, "published": true, "path": "contact-us", "publisher_state": 1, "creation_date": "2014-09-14T18:50:33.093Z", "slug": "contact-us", "publisher_public": 11}}]	Contact Us (contact-us, en)
3843	251	85	85	31	json	[{"pk": 85, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - contact-us-banner.jpg\\" id=\\"plugin_obj_86\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
3844	251	86	86	10	json	[{"pk": 86, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T22:38:31.174Z", "parent": 85, "language": "en", "level": 1, "creation_date": "2014-09-14T22:38:15.230Z", "lft": 2, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "PicturePlugin"}}]	86
3845	251	85	85	10	json	[{"pk": 85, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T22:38:31.215Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T22:38:10.897Z", "lft": 1, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "TextPlugin"}}]	85
3958	261	10	10	9	json	[{"pk": 10, "model": "cms.placeholder", "fields": {"slot": "grid_content", "default_width": null}}]	grid_content
2915	185	8	8	11	json	[{"pk": 8, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 8, "placeholders": [34, 35], "changed_date": "2014-09-14T21:04:12.776Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T20:35:41.020Z", "creation_date": "2014-09-14T20:34:02.734Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Services
2916	185	29	29	31	json	[{"pk": 29, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - services-banner_1.png\\" id=\\"plugin_obj_30\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
1970	112	3	3	11	json	[{"pk": 3, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": false, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "template_1.html", "tree_id": 2, "placeholders": [18, 19], "changed_date": "2014-09-08T01:21:02.215Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-07T23:09:52.067Z", "creation_date": "2014-09-07T23:09:31.722Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	About Us
1971	112	86	86	31	json	[{"pk": 86, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"about-us-gauges bb3\\">\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\u200b<img title=\\"Picture - services-guard.png\\" id=\\"plugin_obj_87\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></li>\\n\\t</ul>\\n\\t</li>\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Services</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. Our rapid response team is here 24/7 365 and we are global in scope. Additionally, Guardiant studies the trends in preventive maintenance and uses that information to develop methodology for true predictive maintenance. We can help you get from the costly reactive maintenvance cycle into a cost effective preventative maintenance plan. Imagine operations where the only downtime is the one you planned for.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	​ Services Guardiant...
3959	261	11	11	9	json	[{"pk": 11, "model": "cms.placeholder", "fields": {"slot": "help_content", "default_width": null}}]	help_content
3960	261	12	12	28	json	[{"pk": 12, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact Us", "url": "", "page_link": null, "phone": "", "anchor": "", "target": ""}}]	Contact Us
3961	261	13	13	28	json	[{"pk": 13, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
3962	261	12	12	10	json	[{"pk": 12, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T19:59:14.136Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:58:57.858Z", "lft": 2, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	12
3963	261	8	8	10	json	[{"pk": 8, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:48:42.335Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:48:23.267Z", "lft": 1, "tree_id": 5, "position": 0, "placeholder": 9, "plugin_type": "TextPlugin"}}]	8
3964	261	11	11	10	json	[{"pk": 11, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-14T19:59:31.307Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:51:07.209Z", "lft": 1, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "TextPlugin"}}]	11
3965	261	11	11	31	json	[{"pk": 11, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact Us\\" id=\\"plugin_obj_12\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_13\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
3966	261	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": "", "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-09-02T00:20:41.372Z", "slug": "home", "publisher_public": 2}}]	Home (home, en)
3967	261	8	8	31	json	[{"pk": 8, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li>\\n\\t<ul>\\n\\t\\t<li class=\\"title\\">Our Leadership</li>\\n\\t\\t<li class=\\"meaning\\">The leadership at Guardiant is headed up by Scott Roys who brings the same innovative and customer centric philosophy that he learned from his father Curtis Roys at CCT. The entire staff is peppered with familiar faces that will remind many people of the way lubrication system services have been and should be run!</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Our Leadership The...
3968	261	169	169	10	json	[{"pk": 169, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-23T22:08:09.626Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-23T22:08:09.620Z", "lft": 1, "tree_id": 52, "position": 0, "placeholder": 6, "plugin_type": "CMSGalleryPlugin"}}]	169
3969	261	4	4	10	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:30:52.388Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 2, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	4
3970	261	13	13	10	json	[{"pk": 13, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-14T19:59:29.618Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:59:18.874Z", "lft": 4, "tree_id": 6, "position": 1, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	13
1923	110	52	52	31	json	[{"pk": 52, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - about-us_1.png\\" id=\\"plugin_obj_53\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>"}}]	
3026	193	39	39	9	json	[{"pk": 39, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3027	193	40	40	9	json	[{"pk": 40, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3028	193	10	10	11	json	[{"pk": 10, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 10, "placeholders": [39, 40], "changed_date": "2014-09-14T21:13:53.064Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": null, "creation_date": "2014-09-14T21:13:18.011Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Distributors
3029	193	82	82	31	json	[{"pk": 82, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - distributors-banner.jpg\\" id=\\"plugin_obj_83\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
3030	193	82	82	10	json	[{"pk": 82, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T21:13:54.470Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T21:13:37.902Z", "lft": 1, "tree_id": 39, "position": 0, "placeholder": 39, "plugin_type": "TextPlugin"}}]	82
3031	193	83	83	10	json	[{"pk": 83, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T21:13:52.945Z", "parent": 82, "language": "en", "level": 1, "creation_date": "2014-09-14T21:13:42.824Z", "lft": 2, "tree_id": 39, "position": 0, "placeholder": 39, "plugin_type": "PicturePlugin"}}]	83
3846	252	32	32	9	json	[{"pk": 32, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2791	177	37	37	31	json	[{"pk": 37, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Lube Design</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>A properly designed lubrication system is essential to the long term profitability of a compressor operation. Proper designs keep mechanical wear to a minimum as well as ensure that only the proper amount of lube is consumed. factors such as rod and piston diameters, operating pressures, field conditions, and gas composition all need to be balanced in a proper design. Part of the design process is scientific, part of the design process is rooted in years of experience. Guardient personnel are the best in the industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>On Site Analysis</h2>\\n\\n\\t\\t<p>In situations where a problem is recurring and can\\u2019t seem to be isolated, an on site analysis is the first step in long term resolution. Give us a call and we\\u2019ll be happy to discuss the problem. Sometimes the problem isn\\u2019t as complicated as it seems and can be identified just by talking through it with one of our knowledgeable people.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Lube Design A...
2792	177	38	38	31	json	[{"pk": 38, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - service-trucks.png\\" id=\\"plugin_obj_39\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2793	177	39	39	25	json	[{"pk": 39, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/service-trucks.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	service-trucks.png
2794	177	8	8	11	json	[{"pk": 8, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 8, "placeholders": [34, 35], "changed_date": "2014-09-14T20:48:21.281Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T20:35:41.020Z", "creation_date": "2014-09-14T20:34:02.734Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Services
2795	177	39	39	10	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:47:45.231Z", "parent": 38, "language": "en", "level": 1, "creation_date": "2014-09-14T20:47:36.482Z", "lft": 2, "tree_id": 22, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	39
2796	177	29	29	31	json	[{"pk": 29, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - services-banner_1.png\\" id=\\"plugin_obj_30\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2797	177	8	8	16	json	[{"pk": 8, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Services", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 8, "published": true, "path": "services", "publisher_state": 0, "creation_date": "2014-09-14T20:34:02.850Z", "slug": "services", "publisher_public": 9}}]	Services (services, en)
2798	177	30	30	25	json	[{"pk": 30, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/services-banner_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	services-banner_1.png
2799	177	38	38	10	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:47:46.643Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:47:30.733Z", "lft": 1, "tree_id": 22, "position": 3, "placeholder": 34, "plugin_type": "TextPlugin"}}]	38
2800	177	29	29	10	json	[{"pk": 29, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:43:21.029Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:34:15.847Z", "lft": 1, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "TextPlugin"}}]	29
2801	177	30	30	10	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:43:17.344Z", "parent": 29, "language": "en", "level": 1, "creation_date": "2014-09-14T20:34:22.410Z", "lft": 2, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	30
2802	177	37	37	10	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T20:46:23.347Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 21, "position": 1, "placeholder": 34, "plugin_type": "TextPlugin"}}]	37
2879	183	37	37	31	json	[{"pk": 37, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"two-up-light\\">\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Lube Design</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>A properly designed lubrication system is essential to the long term profitability of a compressor operation. Proper designs keep mechanical wear to a minimum as well as ensure that only the proper amount of lube is consumed. factors such as rod and piston diameters, operating pressures, field conditions, and gas composition all need to be balanced in a proper design. Part of the design process is scientific, part of the design process is rooted in years of experience. Guardient personnel are the best in the industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>On Site Analysis</h2>\\n\\n\\t\\t<p>In situations where a problem is recurring and can\\u2019t seem to be isolated, an on site analysis is the first step in long term resolution. Give us a call and we\\u2019ll be happy to discuss the problem. Sometimes the problem isn\\u2019t as complicated as it seems and can be identified just by talking through it with one of our knowledgeable people.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Lube Design A...
2880	183	38	38	31	json	[{"pk": 38, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - service-trucks.png\\" id=\\"plugin_obj_39\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2881	183	39	39	25	json	[{"pk": 39, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/service-trucks.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	service-trucks.png
3847	252	33	33	9	json	[{"pk": 33, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3556	221	1	1	11	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": "", "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "homepage.html", "tree_id": 1, "placeholders": [2, 3, 6, 7, 8, 9, 10, 11], "changed_date": "2014-09-20T21:23:04.300Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-09-02T00:20:41.416Z", "creation_date": "2014-09-02T00:20:41.259Z", "level": 0, "changed_by": "brandon", "application_urls": "", "xframe_options": 0, "revision_id": 0}}]	Home
3557	221	2	2	9	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3558	221	3	3	9	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2576	154	3	3	16	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "About Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 3, "published": true, "path": "about-us", "publisher_state": 0, "creation_date": "2014-09-07T23:09:31.805Z", "slug": "about-us", "publisher_public": 4}}]	About Us (about-us, en)
2577	154	3	3	11	json	[{"pk": 3, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": false, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "template_1.html", "tree_id": 2, "placeholders": [18, 19], "changed_date": "2014-09-14T20:06:44.277Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-07T23:09:52.067Z", "creation_date": "2014-09-07T23:09:31.722Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	About Us
2578	154	14	14	31	json	[{"pk": 14, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - about-us_2.png\\" id=\\"plugin_obj_15\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2579	154	15	15	25	json	[{"pk": 15, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/about-us_2.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	about-us_2.png
2580	154	18	18	9	json	[{"pk": 18, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2581	154	19	19	9	json	[{"pk": 19, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2582	154	14	14	10	json	[{"pk": 14, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:06:13.191Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:04:34.300Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 18, "plugin_type": "TextPlugin"}}]	14
2583	154	15	15	10	json	[{"pk": 15, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:06:11.327Z", "parent": 14, "language": "en", "level": 1, "creation_date": "2014-09-14T20:05:20.070Z", "lft": 2, "tree_id": 7, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	15
2584	155	1	1	11	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": "", "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "homepage.html", "tree_id": 1, "placeholders": [2, 3, 6, 7, 8, 9, 10, 11], "changed_date": "2014-09-14T20:06:52.971Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-09-02T00:20:41.416Z", "creation_date": "2014-09-02T00:20:41.259Z", "level": 0, "changed_by": "brandon", "application_urls": "", "xframe_options": 0, "revision_id": 0}}]	Home
2585	155	2	2	9	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2586	155	3	3	9	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3848	252	164	164	46	json	[{"pk": 164, "model": "cmsplugin_guardiant_contact.guardiantcontact", "fields": {"form_layout": "cmsplugin_contact.forms.ContactForm", "recaptcha_theme": "clean", "site_email": "blo.renz@gmail.com", "spam_protection_method": 0, "submit": "Submit", "thanks": "", "redirect_url": "", "form_name": "dsfdsfa", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	blo.renz@gmail.com
3849	252	86	86	25	json	[{"pk": 86, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/7/contact-us-banner.jpg", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	contact-us-banner.jpg
2587	155	4	4	31	json	[{"pk": 4, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHO WE ARE</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems is a privately owned company dedicated to serving the needs of the gas \\u0003transmission industry. Guardiant's core principle is to always do the next right thing. Our mission is to be the leading lubrication systems company in this industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHAT WE DO</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems services the gas transmission industry for all it\\u2019s lubrication needs. We sell the finest parts available, service existing systems, design new lubrication systems, and provide state of the art training programs. At Guardiant, we are never satisfied with the way it\\u2019s always been done. We believe stagnation in design is moving backwards.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	WHO WE ARE...
2588	155	6	6	9	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content
2589	155	1	1	34	json	[{"pk": 1, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/homepage_gallery.html", "title": "Home page Gallery"}}]	1 image(s) in gallery
2590	155	8	8	9	json	[{"pk": 8, "model": "cms.placeholder", "fields": {"slot": "quote_content", "default_width": null}}]	quote_content
2591	155	9	9	10	json	[{"pk": 9, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:46:48.387Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:46:32.123Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 10, "plugin_type": "CMSGalleryPlugin"}}]	9
2592	155	10	10	9	json	[{"pk": 10, "model": "cms.placeholder", "fields": {"slot": "grid_content", "default_width": null}}]	grid_content
2593	155	11	11	9	json	[{"pk": 11, "model": "cms.placeholder", "fields": {"slot": "help_content", "default_width": null}}]	help_content
2594	155	12	12	28	json	[{"pk": 12, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact Us", "url": "", "page_link": null, "phone": "", "anchor": "", "target": ""}}]	Contact Us
2595	155	13	13	28	json	[{"pk": 13, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
2596	155	9	9	34	json	[{"pk": 9, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/grid_gallery.html", "title": "Grid Gallery"}}]	5 image(s) in gallery
2597	155	4	4	10	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:30:52.388Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 2, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	4
2598	155	1	1	10	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:26:53.311Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:26:42.874Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 6, "plugin_type": "CMSGalleryPlugin"}}]	1
2599	155	7	7	9	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "mission_content", "default_width": null}}]	mission_content
2600	155	8	8	31	json	[{"pk": 8, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li>\\n\\t<ul>\\n\\t\\t<li class=\\"title\\">Our Leadership</li>\\n\\t\\t<li class=\\"meaning\\">The leadership at Guardiant is headed up by Scott Roys who brings the same innovative and customer centric philosophy that he learned from his father Curtis Roys at CCT. The entire staff is peppered with familiar faces that will remind many people of the way lubrication system services have been and should be run!</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Our Leadership The...
2601	155	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": "", "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 0, "creation_date": "2014-09-02T00:20:41.372Z", "slug": "home", "publisher_public": 2}}]	Home (home, en)
2602	155	9	9	9	json	[{"pk": 9, "model": "cms.placeholder", "fields": {"slot": "creto_content", "default_width": null}}]	creto_content
2603	155	7	7	10	json	[{"pk": 7, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:38:41.460Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:38:30.478Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 8, "plugin_type": "CMSGalleryPlugin"}}]	7
2604	155	11	11	10	json	[{"pk": 11, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-14T19:59:31.307Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:51:07.209Z", "lft": 1, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "TextPlugin"}}]	11
2803	178	34	34	9	json	[{"pk": 34, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2804	178	35	35	9	json	[{"pk": 35, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2805	178	37	37	31	json	[{"pk": 37, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"2up-light\\">\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Lube Design</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>A properly designed lubrication system is essential to the long term profitability of a compressor operation. Proper designs keep mechanical wear to a minimum as well as ensure that only the proper amount of lube is consumed. factors such as rod and piston diameters, operating pressures, field conditions, and gas composition all need to be balanced in a proper design. Part of the design process is scientific, part of the design process is rooted in years of experience. Guardient personnel are the best in the industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>On Site Analysis</h2>\\n\\n\\t\\t<p>In situations where a problem is recurring and can\\u2019t seem to be isolated, an on site analysis is the first step in long term resolution. Give us a call and we\\u2019ll be happy to discuss the problem. Sometimes the problem isn\\u2019t as complicated as it seems and can be identified just by talking through it with one of our knowledgeable people.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Lube Design A...
2806	178	38	38	31	json	[{"pk": 38, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - service-trucks.png\\" id=\\"plugin_obj_39\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2807	178	39	39	25	json	[{"pk": 39, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/service-trucks.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	service-trucks.png
2808	178	8	8	11	json	[{"pk": 8, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 8, "placeholders": [34, 35], "changed_date": "2014-09-14T20:48:21.462Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T20:35:41.020Z", "creation_date": "2014-09-14T20:34:02.734Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Services
2809	178	39	39	10	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:47:45.231Z", "parent": 38, "language": "en", "level": 1, "creation_date": "2014-09-14T20:47:36.482Z", "lft": 2, "tree_id": 22, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	39
2810	178	29	29	31	json	[{"pk": 29, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - services-banner_1.png\\" id=\\"plugin_obj_30\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2811	178	8	8	16	json	[{"pk": 8, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Services", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 8, "published": true, "path": "services", "publisher_state": 1, "creation_date": "2014-09-14T20:34:02.850Z", "slug": "services", "publisher_public": 9}}]	Services (services, en)
2812	178	30	30	25	json	[{"pk": 30, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/services-banner_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	services-banner_1.png
2813	178	38	38	10	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:47:46.643Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:47:30.733Z", "lft": 1, "tree_id": 22, "position": 3, "placeholder": 34, "plugin_type": "TextPlugin"}}]	38
2814	178	29	29	10	json	[{"pk": 29, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:43:21.029Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:34:15.847Z", "lft": 1, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "TextPlugin"}}]	29
2815	178	30	30	10	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:43:17.344Z", "parent": 29, "language": "en", "level": 1, "creation_date": "2014-09-14T20:34:22.410Z", "lft": 2, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	30
2816	178	37	37	10	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T20:49:29.812Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 21, "position": 1, "placeholder": 34, "plugin_type": "TextPlugin"}}]	37
2817	179	34	34	9	json	[{"pk": 34, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2818	179	35	35	9	json	[{"pk": 35, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2819	179	37	37	31	json	[{"pk": 37, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"2up-light\\">\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Lube Design</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>A properly designed lubrication system is essential to the long term profitability of a compressor operation. Proper designs keep mechanical wear to a minimum as well as ensure that only the proper amount of lube is consumed. factors such as rod and piston diameters, operating pressures, field conditions, and gas composition all need to be balanced in a proper design. Part of the design process is scientific, part of the design process is rooted in years of experience. Guardient personnel are the best in the industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>On Site Analysis</h2>\\n\\n\\t\\t<p>In situations where a problem is recurring and can\\u2019t seem to be isolated, an on site analysis is the first step in long term resolution. Give us a call and we\\u2019ll be happy to discuss the problem. Sometimes the problem isn\\u2019t as complicated as it seems and can be identified just by talking through it with one of our knowledgeable people.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Lube Design A...
2820	179	38	38	31	json	[{"pk": 38, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - service-trucks.png\\" id=\\"plugin_obj_39\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2651	163	34	34	9	json	[{"pk": 34, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2652	163	35	35	9	json	[{"pk": 35, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2821	179	39	39	25	json	[{"pk": 39, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/service-trucks.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	service-trucks.png
984	53	1	1	11	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": "", "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "homepage.html", "tree_id": 1, "placeholders": [2, 3, 6, 7, 8, 9, 10, 11], "changed_date": "2014-09-07T20:15:26.615Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-09-02T00:20:41.416Z", "creation_date": "2014-09-02T00:20:41.259Z", "level": 0, "changed_by": "brandon", "application_urls": "", "xframe_options": 0, "revision_id": 0}}]	Home
985	53	2	2	9	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
986	53	3	3	9	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
987	53	4	4	31	json	[{"pk": 4, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHO WE ARE</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems is a privately owned company dedicated to serving the needs of the gas \\u0003transmission industry. Guardiant's core principle is to always do the next right thing. Our mission is to be the leading lubrication systems company in this industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHAT WE DO</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems services the gas transmission industry for all it\\u2019s lubrication needs. We sell the finest parts available, service existing systems, design new lubrication systems, and provide state of the art training programs. At Guardiant, we are never satisfied with the way it\\u2019s always been done. We believe stagnation in design is moving backwards.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	WHO WE ARE...
988	53	6	6	9	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content
989	53	1	1	34	json	[{"pk": 1, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/homepage_gallery.html", "title": "Home page Gallery"}}]	1 image(s) in gallery
990	53	8	8	9	json	[{"pk": 8, "model": "cms.placeholder", "fields": {"slot": "quote_content", "default_width": null}}]	quote_content
991	53	9	9	10	json	[{"pk": 9, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-07T19:11:47.714Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T03:46:32.322Z", "lft": 1, "tree_id": 8, "position": 0, "placeholder": 10, "plugin_type": "CMSGalleryPlugin"}}]	9
992	53	10	10	9	json	[{"pk": 10, "model": "cms.placeholder", "fields": {"slot": "grid_content", "default_width": null}}]	grid_content
993	53	11	11	9	json	[{"pk": 11, "model": "cms.placeholder", "fields": {"slot": "help_content", "default_width": null}}]	help_content
994	53	13	13	28	json	[{"pk": 13, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact us", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Contact us
995	53	14	14	28	json	[{"pk": 14, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
996	53	9	9	34	json	[{"pk": 9, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/grid_gallery.html", "title": "Grid Gallery"}}]	5 image(s) in gallery
997	53	23	23	10	json	[{"pk": 23, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-07T20:15:12.899Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T20:13:21.199Z", "lft": 1, "tree_id": 16, "position": 3, "placeholder": 11, "plugin_type": "PicturePlugin"}}]	23
998	53	4	4	10	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-07T03:21:56.484Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T03:09:24.910Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	4
999	53	1	1	10	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-07T02:54:19.601Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T02:10:25.018Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 6, "plugin_type": "CMSGalleryPlugin"}}]	1
1000	53	7	7	34	json	[{"pk": 7, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/quote_gallery.html", "title": "Quote Gallery"}}]	1 image(s) in gallery
1001	53	8	8	31	json	[{"pk": 8, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li>\\n\\t<ul>\\n\\t\\t<li class=\\"title\\">Our Leadership</li>\\n\\t\\t<li class=\\"meaning\\">The leadership at Guardiant is headed up by Scott Roys who brings the same innovative and customer centric philosophy that he learned from his father Curtis Roys at CCT. The entire staff is peppered with familiar faces that will remind many people of the way lubrication system services have been and should be run!</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Our Leadership The...
1002	53	10	10	10	json	[{"pk": 10, "model": "cms.cmsplugin", "fields": {"rght": 10, "changed_date": "2014-09-07T19:53:45.727Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T19:38:55.995Z", "lft": 1, "tree_id": 9, "position": 0, "placeholder": 11, "plugin_type": "TextPlugin"}}]	10
1003	53	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": "", "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 0, "creation_date": "2014-09-02T00:20:41.372Z", "slug": "home", "publisher_public": 2}}]	Home (home, en)
1004	53	9	9	9	json	[{"pk": 9, "model": "cms.placeholder", "fields": {"slot": "creto_content", "default_width": null}}]	creto_content
2917	185	30	30	25	json	[{"pk": 30, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/services-banner_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	services-banner_1.png
1005	53	23	23	25	json	[{"pk": 23, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/1/guardiant-truck_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	guardiant-truck_1.png
1006	53	7	7	10	json	[{"pk": 7, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-07T03:34:08.742Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T03:33:14.513Z", "lft": 1, "tree_id": 6, "position": 0, "placeholder": 8, "plugin_type": "CMSGalleryPlugin"}}]	7
1007	53	10	10	31	json	[{"pk": 10, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact us\\" id=\\"plugin_obj_13\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_14\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
1008	53	13	13	10	json	[{"pk": 13, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-09-07T19:53:37.613Z", "parent": 10, "language": "en", "level": 1, "creation_date": "2014-09-07T19:53:34.346Z", "lft": 6, "tree_id": 9, "position": 0, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	13
1009	53	14	14	10	json	[{"pk": 14, "model": "cms.cmsplugin", "fields": {"rght": 9, "changed_date": "2014-09-07T19:53:44.401Z", "parent": 10, "language": "en", "level": 1, "creation_date": "2014-09-07T19:53:41.617Z", "lft": 8, "tree_id": 9, "position": 1, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	14
1010	53	7	7	9	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "mission_content", "default_width": null}}]	mission_content
1011	53	8	8	10	json	[{"pk": 8, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-07T12:45:17.924Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T03:40:27.075Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 9, "plugin_type": "TextPlugin"}}]	8
2653	163	8	8	11	json	[{"pk": 8, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 8, "placeholders": [34, 35], "changed_date": "2014-09-14T20:35:42.315Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T20:35:41.020Z", "creation_date": "2014-09-14T20:34:02.734Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Services
2654	163	29	29	31	json	[{"pk": 29, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - services-banner.jpg\\" id=\\"plugin_obj_30\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2655	163	8	8	16	json	[{"pk": 8, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Services", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 8, "published": true, "path": "services", "publisher_state": 0, "creation_date": "2014-09-14T20:34:02.850Z", "slug": "services", "publisher_public": 9}}]	Services (services, en)
2656	163	30	30	25	json	[{"pk": 30, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/services-banner.jpg", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	services-banner.jpg
2657	163	29	29	10	json	[{"pk": 29, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:34:36.297Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:34:15.847Z", "lft": 1, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "TextPlugin"}}]	29
2658	163	30	30	10	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:34:34.099Z", "parent": 29, "language": "en", "level": 1, "creation_date": "2014-09-14T20:34:22.410Z", "lft": 2, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	30
2822	179	8	8	11	json	[{"pk": 8, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 8, "placeholders": [34, 35], "changed_date": "2014-09-14T20:49:37.755Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T20:35:41.020Z", "creation_date": "2014-09-14T20:34:02.734Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Services
2823	179	39	39	10	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:47:45.231Z", "parent": 38, "language": "en", "level": 1, "creation_date": "2014-09-14T20:47:36.482Z", "lft": 2, "tree_id": 22, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	39
2824	179	29	29	31	json	[{"pk": 29, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - services-banner_1.png\\" id=\\"plugin_obj_30\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2825	179	8	8	16	json	[{"pk": 8, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Services", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 8, "published": true, "path": "services", "publisher_state": 0, "creation_date": "2014-09-14T20:34:02.850Z", "slug": "services", "publisher_public": 9}}]	Services (services, en)
2826	179	30	30	25	json	[{"pk": 30, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/services-banner_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	services-banner_1.png
2827	179	38	38	10	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:47:46.643Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:47:30.733Z", "lft": 1, "tree_id": 22, "position": 3, "placeholder": 34, "plugin_type": "TextPlugin"}}]	38
3559	221	4	4	31	json	[{"pk": 4, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHO WE ARE</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems is a privately owned company dedicated to serving the needs of the gas \\u0003transmission industry. Guardiant's core principle is to always do the next right thing. Our mission is to be the leading lubrication systems company in this industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHAT WE DO</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems services the gas transmission industry for all it\\u2019s lubrication needs. We sell the finest parts available, service existing systems, design new lubrication systems, and provide state of the art training programs. At Guardiant, we are never satisfied with the way it\\u2019s always been done. We believe stagnation in design is moving backwards.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	WHO WE ARE...
3560	221	6	6	9	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content
3561	221	7	7	9	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "mission_content", "default_width": null}}]	mission_content
3562	221	8	8	9	json	[{"pk": 8, "model": "cms.placeholder", "fields": {"slot": "quote_content", "default_width": null}}]	quote_content
3563	221	9	9	9	json	[{"pk": 9, "model": "cms.placeholder", "fields": {"slot": "creto_content", "default_width": null}}]	creto_content
3564	221	10	10	9	json	[{"pk": 10, "model": "cms.placeholder", "fields": {"slot": "grid_content", "default_width": null}}]	grid_content
3565	221	11	11	9	json	[{"pk": 11, "model": "cms.placeholder", "fields": {"slot": "help_content", "default_width": null}}]	help_content
3566	221	12	12	28	json	[{"pk": 12, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact Us", "url": "", "page_link": null, "phone": "", "anchor": "", "target": ""}}]	Contact Us
3567	221	13	13	28	json	[{"pk": 13, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
3568	221	12	12	10	json	[{"pk": 12, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T19:59:14.136Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:58:57.858Z", "lft": 2, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	12
3569	221	8	8	10	json	[{"pk": 8, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:48:42.335Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:48:23.267Z", "lft": 1, "tree_id": 5, "position": 0, "placeholder": 9, "plugin_type": "TextPlugin"}}]	8
3570	221	11	11	10	json	[{"pk": 11, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-14T19:59:31.307Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:51:07.209Z", "lft": 1, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "TextPlugin"}}]	11
3571	221	11	11	31	json	[{"pk": 11, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact Us\\" id=\\"plugin_obj_12\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_13\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
3572	221	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": "", "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 0, "creation_date": "2014-09-02T00:20:41.372Z", "slug": "home", "publisher_public": 2}}]	Home (home, en)
3573	221	8	8	31	json	[{"pk": 8, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li>\\n\\t<ul>\\n\\t\\t<li class=\\"title\\">Our Leadership</li>\\n\\t\\t<li class=\\"meaning\\">The leadership at Guardiant is headed up by Scott Roys who brings the same innovative and customer centric philosophy that he learned from his father Curtis Roys at CCT. The entire staff is peppered with familiar faces that will remind many people of the way lubrication system services have been and should be run!</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Our Leadership The...
3574	221	4	4	10	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:30:52.388Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 2, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	4
3575	221	13	13	10	json	[{"pk": 13, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-14T19:59:29.618Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:59:18.874Z", "lft": 4, "tree_id": 6, "position": 1, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	13
3850	252	7	7	11	json	[{"pk": 7, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 7, "placeholders": [32, 33], "changed_date": "2014-09-21T02:10:58.167Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T22:38:35.974Z", "creation_date": "2014-09-14T18:50:32.945Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Contact Us
3851	252	7	7	16	json	[{"pk": 7, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Contact Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 7, "published": true, "path": "contact-us", "publisher_state": 1, "creation_date": "2014-09-14T18:50:33.093Z", "slug": "contact-us", "publisher_public": 11}}]	Contact Us (contact-us, en)
3852	252	85	85	31	json	[{"pk": 85, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - contact-us-banner.jpg\\" id=\\"plugin_obj_86\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
3853	252	86	86	10	json	[{"pk": 86, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T22:38:31.174Z", "parent": 85, "language": "en", "level": 1, "creation_date": "2014-09-14T22:38:15.230Z", "lft": 2, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "PicturePlugin"}}]	86
2828	179	29	29	10	json	[{"pk": 29, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:43:21.029Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:34:15.847Z", "lft": 1, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "TextPlugin"}}]	29
2829	179	30	30	10	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:43:17.344Z", "parent": 29, "language": "en", "level": 1, "creation_date": "2014-09-14T20:34:22.410Z", "lft": 2, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	30
2830	179	37	37	10	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T20:49:29.812Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 21, "position": 1, "placeholder": 34, "plugin_type": "TextPlugin"}}]	37
2882	183	8	8	11	json	[{"pk": 8, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 8, "placeholders": [34, 35], "changed_date": "2014-09-14T21:00:17.023Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T20:35:41.020Z", "creation_date": "2014-09-14T20:34:02.734Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Services
2883	183	39	39	10	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:47:45.231Z", "parent": 38, "language": "en", "level": 1, "creation_date": "2014-09-14T20:47:36.482Z", "lft": 2, "tree_id": 22, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	39
2884	183	50	50	31	json	[{"pk": 50, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"two-up-blue\\">\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Installation</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>A properly installed lubrication system will eliminate many headaches you will otherwise encounter. In fact, poorly or improperly installed systems are one of the leading causes of system problems. The installation teams at Guardiant are sticklers for getting every detail right.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Stand Alone Lube System</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant builds stand alone lubrication systems that can be set up anywhere, that run independent of any compressor drives, and are designed to fit your specific lubrication needs. The applications for these versatile units are wide open. Anywhere an independant and precision lube source is required.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Installation A properly...
2885	183	29	29	31	json	[{"pk": 29, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - services-banner_1.png\\" id=\\"plugin_obj_30\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2886	183	8	8	16	json	[{"pk": 8, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Services", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 8, "published": true, "path": "services", "publisher_state": 0, "creation_date": "2014-09-14T20:34:02.850Z", "slug": "services", "publisher_public": 9}}]	Services (services, en)
2887	183	50	50	10	json	[{"pk": 50, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T21:00:11.509Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 26, "position": 3, "placeholder": 34, "plugin_type": "TextPlugin"}}]	50
2888	183	30	30	25	json	[{"pk": 30, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/services-banner_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	services-banner_1.png
2889	183	38	38	10	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T21:00:11.527Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:47:30.733Z", "lft": 1, "tree_id": 22, "position": 2, "placeholder": 34, "plugin_type": "TextPlugin"}}]	38
2890	183	29	29	10	json	[{"pk": 29, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T21:00:11.497Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:34:15.847Z", "lft": 1, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "TextPlugin"}}]	29
2891	183	30	30	10	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:43:17.344Z", "parent": 29, "language": "en", "level": 1, "creation_date": "2014-09-14T20:34:22.410Z", "lft": 2, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	30
2892	183	37	37	10	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T21:00:11.519Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 21, "position": 1, "placeholder": 34, "plugin_type": "TextPlugin"}}]	37
2898	184	37	37	31	json	[{"pk": 37, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"two-up-light\\">\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Lube Design</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>A properly designed lubrication system is essential to the long term profitability of a compressor operation. Proper designs keep mechanical wear to a minimum as well as ensure that only the proper amount of lube is consumed. factors such as rod and piston diameters, operating pressures, field conditions, and gas composition all need to be balanced in a proper design. Part of the design process is scientific, part of the design process is rooted in years of experience. Guardient personnel are the best in the industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>On Site Analysis</h2>\\n\\n\\t\\t<p>In situations where a problem is recurring and can\\u2019t seem to be isolated, an on site analysis is the first step in long term resolution. Give us a call and we\\u2019ll be happy to discuss the problem. Sometimes the problem isn\\u2019t as complicated as it seems and can be identified just by talking through it with one of our knowledgeable people.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Lube Design A...
2918	185	34	34	9	json	[{"pk": 34, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3576	222	3	3	16	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "About Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 3, "published": true, "path": "about-us", "publisher_state": 1, "creation_date": "2014-09-07T23:09:31.805Z", "slug": "about-us", "publisher_public": 4}}]	About Us (about-us, en)
3577	222	3	3	11	json	[{"pk": 3, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": false, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "template_1.html", "tree_id": 2, "placeholders": [18, 19], "changed_date": "2014-09-14T20:06:44.519Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-07T23:09:52.067Z", "creation_date": "2014-09-07T23:09:31.722Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	About Us
3578	222	14	14	31	json	[{"pk": 14, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - about-us_2.png\\" id=\\"plugin_obj_15\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
3579	222	15	15	25	json	[{"pk": 15, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/about-us_2.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	about-us_2.png
3580	222	18	18	9	json	[{"pk": 18, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3581	222	19	19	9	json	[{"pk": 19, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3582	222	14	14	10	json	[{"pk": 14, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:06:13.191Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:04:34.300Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 18, "plugin_type": "TextPlugin"}}]	14
3583	222	15	15	10	json	[{"pk": 15, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:06:11.327Z", "parent": 14, "language": "en", "level": 1, "creation_date": "2014-09-14T20:05:20.070Z", "lft": 2, "tree_id": 7, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	15
2691	168	34	34	9	json	[{"pk": 34, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2692	168	35	35	9	json	[{"pk": 35, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2693	168	8	8	11	json	[{"pk": 8, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 8, "placeholders": [34, 35], "changed_date": "2014-09-14T20:43:34.447Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T20:35:41.020Z", "creation_date": "2014-09-14T20:34:02.734Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Services
2694	168	29	29	31	json	[{"pk": 29, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - services-banner_1.png\\" id=\\"plugin_obj_30\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2695	168	8	8	16	json	[{"pk": 8, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Services", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 8, "published": true, "path": "services", "publisher_state": 0, "creation_date": "2014-09-14T20:34:02.850Z", "slug": "services", "publisher_public": 9}}]	Services (services, en)
2696	168	30	30	25	json	[{"pk": 30, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/services-banner_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	services-banner_1.png
2697	168	29	29	10	json	[{"pk": 29, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:43:21.029Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:34:15.847Z", "lft": 1, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "TextPlugin"}}]	29
2698	168	30	30	10	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:43:17.344Z", "parent": 29, "language": "en", "level": 1, "creation_date": "2014-09-14T20:34:22.410Z", "lft": 2, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	30
3584	222	149	149	10	json	[{"pk": 149, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-20T21:28:43.608Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-20T21:28:43.598Z", "lft": 1, "tree_id": 48, "position": 2, "placeholder": 18, "plugin_type": "TextPlugin"}}]	149
3585	223	3	3	16	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "About Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 3, "published": true, "path": "about-us", "publisher_state": 1, "creation_date": "2014-09-07T23:09:31.805Z", "slug": "about-us", "publisher_public": 4}}]	About Us (about-us, en)
3586	223	3	3	11	json	[{"pk": 3, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": false, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "template_1.html", "tree_id": 2, "placeholders": [18, 19], "changed_date": "2014-09-20T21:28:43.667Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-07T23:09:52.067Z", "creation_date": "2014-09-07T23:09:31.722Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	About Us
3587	223	14	14	31	json	[{"pk": 14, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - about-us_2.png\\" id=\\"plugin_obj_15\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
3588	223	14	14	10	json	[{"pk": 14, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:06:13.191Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:04:34.300Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 18, "plugin_type": "TextPlugin"}}]	14
3589	223	15	15	25	json	[{"pk": 15, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/about-us_2.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	about-us_2.png
3590	223	18	18	9	json	[{"pk": 18, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3591	223	19	19	9	json	[{"pk": 19, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2831	180	34	34	9	json	[{"pk": 34, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2832	180	35	35	9	json	[{"pk": 35, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2833	180	37	37	31	json	[{"pk": 37, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"two-up-light\\">\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Lube Design</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>A properly designed lubrication system is essential to the long term profitability of a compressor operation. Proper designs keep mechanical wear to a minimum as well as ensure that only the proper amount of lube is consumed. factors such as rod and piston diameters, operating pressures, field conditions, and gas composition all need to be balanced in a proper design. Part of the design process is scientific, part of the design process is rooted in years of experience. Guardient personnel are the best in the industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>On Site Analysis</h2>\\n\\n\\t\\t<p>In situations where a problem is recurring and can\\u2019t seem to be isolated, an on site analysis is the first step in long term resolution. Give us a call and we\\u2019ll be happy to discuss the problem. Sometimes the problem isn\\u2019t as complicated as it seems and can be identified just by talking through it with one of our knowledgeable people.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Lube Design A...
2834	180	38	38	31	json	[{"pk": 38, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - service-trucks.png\\" id=\\"plugin_obj_39\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2835	180	39	39	25	json	[{"pk": 39, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/service-trucks.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	service-trucks.png
2836	180	8	8	11	json	[{"pk": 8, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 8, "placeholders": [34, 35], "changed_date": "2014-09-14T20:49:37.953Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T20:35:41.020Z", "creation_date": "2014-09-14T20:34:02.734Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Services
2837	180	39	39	10	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:47:45.231Z", "parent": 38, "language": "en", "level": 1, "creation_date": "2014-09-14T20:47:36.482Z", "lft": 2, "tree_id": 22, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	39
2838	180	29	29	31	json	[{"pk": 29, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - services-banner_1.png\\" id=\\"plugin_obj_30\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2839	180	8	8	16	json	[{"pk": 8, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Services", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 8, "published": true, "path": "services", "publisher_state": 1, "creation_date": "2014-09-14T20:34:02.850Z", "slug": "services", "publisher_public": 9}}]	Services (services, en)
2840	180	30	30	25	json	[{"pk": 30, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/services-banner_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	services-banner_1.png
2841	180	38	38	10	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:47:46.643Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:47:30.733Z", "lft": 1, "tree_id": 22, "position": 3, "placeholder": 34, "plugin_type": "TextPlugin"}}]	38
2842	180	29	29	10	json	[{"pk": 29, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:43:21.029Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:34:15.847Z", "lft": 1, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "TextPlugin"}}]	29
2843	180	30	30	10	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:43:17.344Z", "parent": 29, "language": "en", "level": 1, "creation_date": "2014-09-14T20:34:22.410Z", "lft": 2, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	30
2844	180	37	37	10	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T20:52:49.300Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 21, "position": 1, "placeholder": 34, "plugin_type": "TextPlugin"}}]	37
2845	181	34	34	9	json	[{"pk": 34, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2846	181	35	35	9	json	[{"pk": 35, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2847	181	37	37	31	json	[{"pk": 37, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"two-up-light\\">\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Lube Design</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>A properly designed lubrication system is essential to the long term profitability of a compressor operation. Proper designs keep mechanical wear to a minimum as well as ensure that only the proper amount of lube is consumed. factors such as rod and piston diameters, operating pressures, field conditions, and gas composition all need to be balanced in a proper design. Part of the design process is scientific, part of the design process is rooted in years of experience. Guardient personnel are the best in the industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>On Site Analysis</h2>\\n\\n\\t\\t<p>In situations where a problem is recurring and can\\u2019t seem to be isolated, an on site analysis is the first step in long term resolution. Give us a call and we\\u2019ll be happy to discuss the problem. Sometimes the problem isn\\u2019t as complicated as it seems and can be identified just by talking through it with one of our knowledgeable people.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Lube Design A...
3592	223	149	149	10	json	[{"pk": 149, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-20T21:30:19.033Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-20T21:28:43.598Z", "lft": 1, "tree_id": 48, "position": 2, "placeholder": 18, "plugin_type": "TextPlugin"}}]	149
2708	170	34	34	9	json	[{"pk": 34, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3971	262	1	1	11	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": "", "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "homepage.html", "tree_id": 1, "placeholders": [2, 3, 6, 7, 8, 9, 10, 11], "changed_date": "2014-09-23T22:08:45.735Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-09-02T00:20:41.416Z", "creation_date": "2014-09-02T00:20:41.259Z", "level": 0, "changed_by": "brandon", "application_urls": "", "xframe_options": 0, "revision_id": 0}}]	Home
3972	262	2	2	9	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3973	262	3	3	9	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3974	262	4	4	31	json	[{"pk": 4, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHO WE ARE</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems is a privately owned company dedicated to serving the needs of the gas \\u0003transmission industry. Guardiant's core principle is to always do the next right thing. Our mission is to be the leading lubrication systems company in this industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHAT WE DO</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems services the gas transmission industry for all it\\u2019s lubrication needs. We sell the finest parts available, service existing systems, design new lubrication systems, and provide state of the art training programs. At Guardiant, we are never satisfied with the way it\\u2019s always been done. We believe stagnation in design is moving backwards.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	WHO WE ARE...
3975	262	6	6	9	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content
3976	262	7	7	9	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "mission_content", "default_width": null}}]	mission_content
3977	262	8	8	9	json	[{"pk": 8, "model": "cms.placeholder", "fields": {"slot": "quote_content", "default_width": null}}]	quote_content
3978	262	9	9	9	json	[{"pk": 9, "model": "cms.placeholder", "fields": {"slot": "creto_content", "default_width": null}}]	creto_content
3979	262	10	10	9	json	[{"pk": 10, "model": "cms.placeholder", "fields": {"slot": "grid_content", "default_width": null}}]	grid_content
3980	262	11	11	9	json	[{"pk": 11, "model": "cms.placeholder", "fields": {"slot": "help_content", "default_width": null}}]	help_content
3981	262	12	12	28	json	[{"pk": 12, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact Us", "url": "", "page_link": null, "phone": "", "anchor": "", "target": ""}}]	Contact Us
3982	262	13	13	28	json	[{"pk": 13, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
3983	262	12	12	10	json	[{"pk": 12, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T19:59:14.136Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:58:57.858Z", "lft": 2, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	12
3984	262	8	8	10	json	[{"pk": 8, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:48:42.335Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:48:23.267Z", "lft": 1, "tree_id": 5, "position": 0, "placeholder": 9, "plugin_type": "TextPlugin"}}]	8
3985	262	11	11	10	json	[{"pk": 11, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-14T19:59:31.307Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:51:07.209Z", "lft": 1, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "TextPlugin"}}]	11
3986	262	11	11	31	json	[{"pk": 11, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact Us\\" id=\\"plugin_obj_12\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_13\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
3987	262	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": "", "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-09-02T00:20:41.372Z", "slug": "home", "publisher_public": 2}}]	Home (home, en)
3988	262	8	8	31	json	[{"pk": 8, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li>\\n\\t<ul>\\n\\t\\t<li class=\\"title\\">Our Leadership</li>\\n\\t\\t<li class=\\"meaning\\">The leadership at Guardiant is headed up by Scott Roys who brings the same innovative and customer centric philosophy that he learned from his father Curtis Roys at CCT. The entire staff is peppered with familiar faces that will remind many people of the way lubrication system services have been and should be run!</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Our Leadership The...
2709	170	35	35	10	json	[{"pk": 35, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T20:44:08.277Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:44:08.270Z", "lft": 1, "tree_id": 19, "position": 2, "placeholder": 34, "plugin_type": "TextPlugin"}}]	35
3989	262	4	4	10	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:30:52.388Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 2, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	4
3990	262	13	13	10	json	[{"pk": 13, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-14T19:59:29.618Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:59:18.874Z", "lft": 4, "tree_id": 6, "position": 1, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	13
2710	170	37	37	31	json	[{"pk": 37, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHO WE ARE</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems is a privately owned company dedicated to serving the needs of the gas \\u0003transmission industry. Guardiant's core principle is to always do the next right thing. Our mission is to be the leading lubrication systems company in this industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHAT WE DO</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems services the gas transmission industry for all it\\u2019s lubrication needs. We sell the finest parts available, service existing systems, design new lubrication systems, and provide state of the art training programs. At Guardiant, we are never satisfied with the way it\\u2019s always been done. We believe stagnation in design is moving backwards.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	WHO WE ARE...
2711	170	8	8	11	json	[{"pk": 8, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 8, "placeholders": [34, 35], "changed_date": "2014-09-14T20:44:08.334Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T20:35:41.020Z", "creation_date": "2014-09-14T20:34:02.734Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Services
2712	170	29	29	31	json	[{"pk": 29, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - services-banner_1.png\\" id=\\"plugin_obj_30\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2713	170	8	8	16	json	[{"pk": 8, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Services", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 8, "published": true, "path": "services", "publisher_state": 1, "creation_date": "2014-09-14T20:34:02.850Z", "slug": "services", "publisher_public": 9}}]	Services (services, en)
2714	170	35	35	9	json	[{"pk": 35, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2715	170	30	30	25	json	[{"pk": 30, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/services-banner_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	services-banner_1.png
2716	170	29	29	10	json	[{"pk": 29, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:43:21.029Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:34:15.847Z", "lft": 1, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "TextPlugin"}}]	29
2717	170	30	30	10	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:43:17.344Z", "parent": 29, "language": "en", "level": 1, "creation_date": "2014-09-14T20:34:22.410Z", "lft": 2, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	30
2718	170	37	37	10	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T20:44:59.889Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 21, "position": 0, "placeholder": 34, "plugin_type": "TextPlugin"}}]	37
2848	181	38	38	31	json	[{"pk": 38, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - service-trucks.png\\" id=\\"plugin_obj_39\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2849	181	39	39	25	json	[{"pk": 39, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/service-trucks.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	service-trucks.png
2850	181	8	8	11	json	[{"pk": 8, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 8, "placeholders": [34, 35], "changed_date": "2014-09-14T20:52:49.451Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T20:35:41.020Z", "creation_date": "2014-09-14T20:34:02.734Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Services
2851	181	39	39	10	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:47:45.231Z", "parent": 38, "language": "en", "level": 1, "creation_date": "2014-09-14T20:47:36.482Z", "lft": 2, "tree_id": 22, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	39
2852	181	50	50	31	json	[{"pk": 50, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"two-up-blue\\">\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Installation</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>A properly installed lubrication system will eliminate many headaches you will otherwise encounter. In fact, poorly or improperly installed systems are one of the leading causes of system problems. The installation teams at Guardiant are sticklers for getting every detail right.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Stand Alone Lube System</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant builds stand alone lubrication systems that can be set up anywhere, that run independent of any compressor drives, and are designed to fit your specific lubrication needs. The applications for these versatile units are wide open. Anywhere an independant and precision lube source is required.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Installation A properly...
2853	181	29	29	31	json	[{"pk": 29, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - services-banner_1.png\\" id=\\"plugin_obj_30\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2854	181	8	8	16	json	[{"pk": 8, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Services", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 8, "published": true, "path": "services", "publisher_state": 1, "creation_date": "2014-09-14T20:34:02.850Z", "slug": "services", "publisher_public": 9}}]	Services (services, en)
2919	185	35	35	9	json	[{"pk": 35, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
1972	112	87	87	10	json	[{"pk": 87, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:54:24.623Z", "parent": 86, "language": "en", "level": 1, "creation_date": "2014-09-07T23:27:37.395Z", "lft": 2, "tree_id": 38, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	87
2719	171	34	34	9	json	[{"pk": 34, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2720	171	35	35	9	json	[{"pk": 35, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3991	263	1	1	11	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": "", "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "homepage.html", "tree_id": 1, "placeholders": [2, 3, 6, 7, 8, 9, 10, 11], "changed_date": "2014-09-23T22:08:45.843Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-09-02T00:20:41.416Z", "creation_date": "2014-09-02T00:20:41.259Z", "level": 0, "changed_by": "brandon", "application_urls": "", "xframe_options": 0, "revision_id": 0}}]	Home
3992	263	2	2	9	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3993	263	3	3	9	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2899	184	38	38	31	json	[{"pk": 38, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - service-trucks.png\\" id=\\"plugin_obj_39\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
1830	107	87	87	25	json	[{"pk": 87, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/services-guard.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	services-guard.png
1831	107	94	94	28	json	[{"pk": 94, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact us", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Contact us
1832	107	18	18	9	json	[{"pk": 18, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
1833	107	19	19	9	json	[{"pk": 19, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
1834	107	68	68	31	json	[{"pk": 68, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - guardiant-truck_1.png\\" id=\\"plugin_obj_70\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
1835	107	70	70	25	json	[{"pk": 70, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/guardiant-truck_1.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	guardiant-truck_1.png
1836	107	93	93	31	json	[{"pk": 93, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"help-container\\">\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact us\\" id=\\"plugin_obj_94\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link - Contact us\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_95\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link - Find a distributor\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
1837	107	52	52	10	json	[{"pk": 52, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-07T23:55:40.597Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:12:33.888Z", "lft": 1, "tree_id": 25, "position": 0, "placeholder": 18, "plugin_type": "TextPlugin"}}]	52
1838	107	53	53	25	json	[{"pk": 53, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/about-us_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	about-us_1.png
1839	107	52	52	31	json	[{"pk": 52, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - about-us_1.png\\" id=\\"plugin_obj_53\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>"}}]	
1840	107	58	58	10	json	[{"pk": 58, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-07T23:55:40.605Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:25:58.378Z", "lft": 1, "tree_id": 28, "position": 1, "placeholder": 18, "plugin_type": "TextPlugin"}}]	58
1841	107	95	95	28	json	[{"pk": 95, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
1842	107	60	60	10	json	[{"pk": 60, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:51:40.662Z", "parent": 58, "language": "en", "level": 1, "creation_date": "2014-09-07T23:27:37.395Z", "lft": 2, "tree_id": 28, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	60
1843	107	53	53	10	json	[{"pk": 53, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:12:54.627Z", "parent": 52, "language": "en", "level": 1, "creation_date": "2014-09-07T23:12:42.336Z", "lft": 2, "tree_id": 25, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	53
1844	107	68	68	10	json	[{"pk": 68, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-07T23:55:40.614Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:39:16.553Z", "lft": 1, "tree_id": 33, "position": 2, "placeholder": 18, "plugin_type": "TextPlugin"}}]	68
1845	107	69	69	10	json	[{"pk": 69, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:50:38.241Z", "parent": 68, "language": "en", "level": 1, "creation_date": "2014-09-07T23:39:22.447Z", "lft": 2, "tree_id": 33, "position": 0, "placeholder": 18, "plugin_type": "FilePlugin"}}]	69
1846	107	70	70	10	json	[{"pk": 70, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-07T23:50:38.248Z", "parent": 68, "language": "en", "level": 1, "creation_date": "2014-09-07T23:39:26.116Z", "lft": 4, "tree_id": 33, "position": 1, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	70
1847	107	86	86	10	json	[{"pk": 86, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-07T23:55:40.632Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:25:58.378Z", "lft": 1, "tree_id": 38, "position": 3, "placeholder": 18, "plugin_type": "TextPlugin"}}]	86
1973	112	94	94	28	json	[{"pk": 94, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact us", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Contact us
1974	112	18	18	9	json	[{"pk": 18, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
1975	112	19	19	9	json	[{"pk": 19, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
1976	112	68	68	31	json	[{"pk": 68, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - guardiant-truck_1.png\\" id=\\"plugin_obj_70\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
1977	112	70	70	25	json	[{"pk": 70, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/guardiant-truck_1.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	guardiant-truck_1.png
1978	112	93	93	31	json	[{"pk": 93, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"help-container\\">\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact us\\" id=\\"plugin_obj_94\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link - Contact us\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_95\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link - Find a distributor\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
1979	112	52	52	10	json	[{"pk": 52, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-08T01:24:09.699Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:12:33.888Z", "lft": 1, "tree_id": 25, "position": 0, "placeholder": 18, "plugin_type": "TextPlugin"}}]	52
1980	112	53	53	25	json	[{"pk": 53, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/about-us_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	about-us_1.png
1981	112	52	52	31	json	[{"pk": 52, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - about-us_1.png\\" id=\\"plugin_obj_53\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>"}}]	
1982	112	58	58	10	json	[{"pk": 58, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-08T01:24:09.710Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:25:58.378Z", "lft": 1, "tree_id": 28, "position": 1, "placeholder": 18, "plugin_type": "TextPlugin"}}]	58
1983	112	95	95	28	json	[{"pk": 95, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
1984	112	60	60	10	json	[{"pk": 60, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:51:40.662Z", "parent": 58, "language": "en", "level": 1, "creation_date": "2014-09-07T23:27:37.395Z", "lft": 2, "tree_id": 28, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	60
1985	112	53	53	10	json	[{"pk": 53, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:12:54.627Z", "parent": 52, "language": "en", "level": 1, "creation_date": "2014-09-07T23:12:42.336Z", "lft": 2, "tree_id": 25, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	53
1986	112	68	68	10	json	[{"pk": 68, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-08T01:24:09.722Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:39:16.553Z", "lft": 1, "tree_id": 33, "position": 2, "placeholder": 18, "plugin_type": "TextPlugin"}}]	68
1987	112	69	69	10	json	[{"pk": 69, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:50:38.241Z", "parent": 68, "language": "en", "level": 1, "creation_date": "2014-09-07T23:39:22.447Z", "lft": 2, "tree_id": 33, "position": 0, "placeholder": 18, "plugin_type": "FilePlugin"}}]	69
1988	112	70	70	10	json	[{"pk": 70, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-07T23:50:38.248Z", "parent": 68, "language": "en", "level": 1, "creation_date": "2014-09-07T23:39:26.116Z", "lft": 4, "tree_id": 33, "position": 1, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	70
1989	112	97	97	31	json	[{"pk": 97, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"definition-with-quote\\">\\n\\t<li class=\\"definition\\">\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Training</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>When your work force is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill the need. Guardiant trainers have extensive backgrounds in compressor maintenance and are excellent teachers. High end training aids such as animated videos, comprehensive manuals, and hands on training ensure you get the most effective use of your training dollars.\\u00a0</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"quote\\">\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\u201c We believe that excellent training will propel this industry forward. We want to be your asset to help in the field, classroom or even providing assistance with our 24/7/365 \\u0003service line.\\u201d</li>\\n\\t\\t<li class=\\"whom\\">Scott Roys</li>\\n\\t</ul>\\n\\t</li>\\n</ul>"}}]	Training When your...
1990	112	86	86	10	json	[{"pk": 86, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-08T01:24:09.739Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:25:58.378Z", "lft": 1, "tree_id": 38, "position": 4, "placeholder": 18, "plugin_type": "TextPlugin"}}]	86
1991	112	87	87	25	json	[{"pk": 87, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/services-guard.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	services-guard.png
1992	112	58	58	31	json	[{"pk": 58, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"about-us-gauges bb3\\">\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Replacement Parts</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Parts manufactured for Guardiant are made with the best materials available and meet the tightest tolerances in the industry. Our highly trained staff is ready to assist you in identifying the exact part you need and getting it into your hands as quickly as possible. We know compressors and we know how to get you rolling again.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li><img title=\\"Picture - guardiant-gauges_1.png\\" id=\\"plugin_obj_60\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Replacement Parts Guardiant...
1993	112	94	94	10	json	[{"pk": 94, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:55:40.574Z", "parent": 93, "language": "en", "level": 1, "creation_date": "2014-09-07T19:53:34.346Z", "lft": 2, "tree_id": 42, "position": 0, "placeholder": 18, "plugin_type": "LinkPlugin"}}]	94
1994	112	95	95	10	json	[{"pk": 95, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-07T23:55:40.579Z", "parent": 93, "language": "en", "level": 1, "creation_date": "2014-09-07T19:53:41.617Z", "lft": 4, "tree_id": 42, "position": 1, "placeholder": 18, "plugin_type": "LinkPlugin"}}]	95
1995	112	3	3	16	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "About Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 3, "published": true, "path": "about-us", "publisher_state": 1, "creation_date": "2014-09-07T23:09:31.805Z", "slug": "about-us", "publisher_public": 4}}]	About Us (about-us, en)
1996	112	97	97	10	json	[{"pk": 97, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-08T01:24:09.762Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-08T00:04:27.520Z", "lft": 1, "tree_id": 43, "position": 3, "placeholder": 18, "plugin_type": "TextPlugin"}}]	97
1997	112	60	60	25	json	[{"pk": 60, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/guardiant-gauges_1.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	guardiant-gauges_1.png
1998	112	93	93	10	json	[{"pk": 93, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-08T01:24:09.751Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T19:38:55.995Z", "lft": 1, "tree_id": 42, "position": 5, "placeholder": 18, "plugin_type": "TextPlugin"}}]	93
2118	123	101	101	10	json	[{"pk": 101, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-08T01:36:36.802Z", "parent": 100, "language": "en", "level": 1, "creation_date": "2014-09-07T23:12:42.336Z", "lft": 2, "tree_id": 45, "position": 0, "placeholder": 25, "plugin_type": "PicturePlugin"}}]	101
2721	171	37	37	31	json	[{"pk": 37, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHO WE ARE</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems is a privately owned company dedicated to serving the needs of the gas \\u0003transmission industry. Guardiant's core principle is to always do the next right thing. Our mission is to be the leading lubrication systems company in this industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHAT WE DO</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems services the gas transmission industry for all it\\u2019s lubrication needs. We sell the finest parts available, service existing systems, design new lubrication systems, and provide state of the art training programs. At Guardiant, we are never satisfied with the way it\\u2019s always been done. We believe stagnation in design is moving backwards.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	WHO WE ARE...
2722	171	8	8	11	json	[{"pk": 8, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 8, "placeholders": [34, 35], "changed_date": "2014-09-14T20:45:08.874Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T20:35:41.020Z", "creation_date": "2014-09-14T20:34:02.734Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Services
2723	171	29	29	31	json	[{"pk": 29, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - services-banner_1.png\\" id=\\"plugin_obj_30\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2724	171	8	8	16	json	[{"pk": 8, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Services", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 8, "published": true, "path": "services", "publisher_state": 1, "creation_date": "2014-09-14T20:34:02.850Z", "slug": "services", "publisher_public": 9}}]	Services (services, en)
2725	171	30	30	25	json	[{"pk": 30, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/services-banner_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	services-banner_1.png
2726	171	29	29	10	json	[{"pk": 29, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:43:21.029Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:34:15.847Z", "lft": 1, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "TextPlugin"}}]	29
2727	171	30	30	10	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:43:17.344Z", "parent": 29, "language": "en", "level": 1, "creation_date": "2014-09-14T20:34:22.410Z", "lft": 2, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	30
2728	171	37	37	10	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T20:45:08.814Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 21, "position": 1, "placeholder": 34, "plugin_type": "TextPlugin"}}]	37
2855	181	50	50	10	json	[{"pk": 50, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T21:00:01.587Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 26, "position": 0, "placeholder": 34, "plugin_type": "TextPlugin"}}]	50
2856	181	30	30	25	json	[{"pk": 30, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/services-banner_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	services-banner_1.png
2857	181	38	38	10	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:47:46.643Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:47:30.733Z", "lft": 1, "tree_id": 22, "position": 3, "placeholder": 34, "plugin_type": "TextPlugin"}}]	38
2858	181	29	29	10	json	[{"pk": 29, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:43:21.029Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:34:15.847Z", "lft": 1, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "TextPlugin"}}]	29
1403	84	52	52	31	json	[{"pk": 52, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - about-us_1.png\\" id=\\"plugin_obj_53\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>"}}]	
1999	113	24	24	9	json	[{"pk": 24, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2000	113	25	25	9	json	[{"pk": 25, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2001	113	5	5	11	json	[{"pk": 5, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 5, "placeholders": [24, 25], "changed_date": "2014-09-08T01:25:48.272Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": null, "creation_date": "2014-09-08T01:25:48.188Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Products
2002	113	5	5	16	json	[{"pk": 5, "model": "cms.title", "fields": {"menu_title": "Products", "meta_description": "", "page_title": "", "language": "en", "title": "Products", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 5, "published": false, "path": "products", "publisher_state": 1, "creation_date": "2014-09-08T01:25:48.269Z", "slug": "products", "publisher_public": null}}]	Products (products, en)
2003	114	5	5	11	json	[{"pk": 5, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "products.html", "tree_id": 5, "placeholders": [24, 25, 26, 27], "changed_date": "2014-09-08T01:28:17.876Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": null, "creation_date": "2014-09-08T01:25:48.188Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Products
1388	84	3	3	16	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "About Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 3, "published": true, "path": "about-us", "publisher_state": 0, "creation_date": "2014-09-07T23:09:31.805Z", "slug": "about-us", "publisher_public": 4}}]	About Us (about-us, en)
1389	84	3	3	11	json	[{"pk": 3, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": false, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 3, "placeholders": [18, 19], "changed_date": "2014-09-07T23:38:07.929Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-07T23:09:52.067Z", "creation_date": "2014-09-07T23:09:31.722Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	About Us
1390	84	60	60	25	json	[{"pk": 60, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/guardiant-gauges_1.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	guardiant-gauges_1.png
1391	84	56	56	31	json	[{"pk": 56, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - guardiant-truck.png\\" id=\\"plugin_obj_57\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
1392	84	18	18	9	json	[{"pk": 18, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
1393	84	19	19	9	json	[{"pk": 19, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
1394	84	52	52	10	json	[{"pk": 52, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-07T23:28:06.734Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:12:33.888Z", "lft": 1, "tree_id": 25, "position": 0, "placeholder": 18, "plugin_type": "TextPlugin"}}]	52
1395	84	53	53	25	json	[{"pk": 53, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/about-us_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	about-us_1.png
1396	84	57	57	25	json	[{"pk": 57, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/guardiant-truck.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	guardiant-truck.png
1397	84	56	56	10	json	[{"pk": 56, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-07T23:28:06.745Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:24:12.340Z", "lft": 1, "tree_id": 27, "position": 1, "placeholder": 18, "plugin_type": "TextPlugin"}}]	56
1398	84	57	57	10	json	[{"pk": 57, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:24:29.359Z", "parent": 56, "language": "en", "level": 1, "creation_date": "2014-09-07T23:24:21.925Z", "lft": 2, "tree_id": 27, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	57
1399	84	58	58	31	json	[{"pk": 58, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"about-us-gauges\\">\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Replacement Parts</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Parts manufactured for Guardiant are made with the best materials available and meet the tightest tolerances in the industry. Our highly trained staff is ready to assist you in identifying the exact part you need and getting it into your hands as quickly as possible. We know compressors and we know how to get you rolling again.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li><img title=\\"Picture - guardiant-gauges_1.png\\" id=\\"plugin_obj_60\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Replacement Parts Guardiant...
1400	84	53	53	10	json	[{"pk": 53, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:12:54.627Z", "parent": 52, "language": "en", "level": 1, "creation_date": "2014-09-07T23:12:42.336Z", "lft": 2, "tree_id": 25, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	53
1401	84	60	60	10	json	[{"pk": 60, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:28:49.159Z", "parent": 58, "language": "en", "level": 1, "creation_date": "2014-09-07T23:27:37.395Z", "lft": 2, "tree_id": 28, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	60
1402	84	58	58	10	json	[{"pk": 58, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-07T23:32:38.104Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:25:58.378Z", "lft": 1, "tree_id": 28, "position": 2, "placeholder": 18, "plugin_type": "TextPlugin"}}]	58
2004	114	24	24	9	json	[{"pk": 24, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2005	114	25	25	9	json	[{"pk": 25, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2006	114	26	26	9	json	[{"pk": 26, "model": "cms.placeholder", "fields": {"slot": "general", "default_width": null}}]	general
2007	114	27	27	9	json	[{"pk": 27, "model": "cms.placeholder", "fields": {"slot": "products", "default_width": null}}]	products
2008	114	5	5	16	json	[{"pk": 5, "model": "cms.title", "fields": {"menu_title": "Products", "meta_description": "", "page_title": "", "language": "en", "title": "Products", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 5, "published": false, "path": "products", "publisher_state": 1, "creation_date": "2014-09-08T01:25:48.269Z", "slug": "products", "publisher_public": null}}]	Products (products, en)
2119	124	100	100	31	json	[{"pk": 100, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"header\\"><img title=\\"Picture - products-banner.png\\" id=\\"plugin_obj_101\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2120	124	5	5	11	json	[{"pk": 5, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "products.html", "tree_id": 5, "placeholders": [24, 25, 26, 27], "changed_date": "2014-09-08T01:36:36.908Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-08T01:35:10.386Z", "creation_date": "2014-09-08T01:25:48.188Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Products
2121	124	104	104	31	json	[{"pk": 104, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"about-us-gauges bb3\\">\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>OVERVIEW</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant is committed to supplying high quality parts as quickly as possible. Our warehouse is kept stocked and in almost all cases, we can fulfill your requests immediately. Because parts can be highly configurable or cosmetically similar but functionally different, we always suggest that you talk with our staff before ordering. Our staff members are highly trained and have years of experience in the lubrication field.\\u00a0</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li><img title=\\"Picture - guardiant-screw.png\\" id=\\"plugin_obj_105\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	OVERVIEW Guardiant is...
2122	124	105	105	25	json	[{"pk": 105, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/5/guardiant-screw.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	guardiant-screw.png
2123	124	5	5	16	json	[{"pk": 5, "model": "cms.title", "fields": {"menu_title": "Products", "meta_description": "", "page_title": "", "language": "en", "title": "Products", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 5, "published": true, "path": "products", "publisher_state": 1, "creation_date": "2014-09-08T01:25:48.269Z", "slug": "products", "publisher_public": 6}}]	Products (products, en)
2124	124	104	104	10	json	[{"pk": 104, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-08T01:34:55.963Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:25:58.378Z", "lft": 1, "tree_id": 47, "position": 1, "placeholder": 26, "plugin_type": "TextPlugin"}}]	104
2125	124	25	25	9	json	[{"pk": 25, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2126	124	105	105	10	json	[{"pk": 105, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-08T01:34:25.473Z", "parent": 104, "language": "en", "level": 1, "creation_date": "2014-09-07T23:27:37.395Z", "lft": 2, "tree_id": 47, "position": 0, "placeholder": 26, "plugin_type": "PicturePlugin"}}]	105
2127	124	24	24	9	json	[{"pk": 24, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2128	124	100	100	10	json	[{"pk": 100, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-08T01:36:49.589Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:12:33.888Z", "lft": 1, "tree_id": 45, "position": 0, "placeholder": 25, "plugin_type": "TextPlugin"}}]	100
2129	124	26	26	9	json	[{"pk": 26, "model": "cms.placeholder", "fields": {"slot": "general", "default_width": null}}]	general
2130	124	27	27	9	json	[{"pk": 27, "model": "cms.placeholder", "fields": {"slot": "products", "default_width": null}}]	products
2131	124	101	101	25	json	[{"pk": 101, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/5/products-banner.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	products-banner.png
2132	124	101	101	10	json	[{"pk": 101, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-08T01:36:36.802Z", "parent": 100, "language": "en", "level": 1, "creation_date": "2014-09-07T23:12:42.336Z", "lft": 2, "tree_id": 45, "position": 0, "placeholder": 25, "plugin_type": "PicturePlugin"}}]	101
2133	125	32	32	9	json	[{"pk": 32, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2134	125	33	33	9	json	[{"pk": 33, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2135	125	7	7	16	json	[{"pk": 7, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Contact Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 7, "published": false, "path": "contact-us", "publisher_state": 1, "creation_date": "2014-09-14T18:50:33.093Z", "slug": "contact-us", "publisher_public": null}}]	Contact Us (contact-us, en)
2136	125	7	7	11	json	[{"pk": 7, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 7, "placeholders": [32, 33], "changed_date": "2014-09-14T18:50:33.098Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": null, "creation_date": "2014-09-14T18:50:32.945Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Contact Us
2729	172	34	34	9	json	[{"pk": 34, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2730	172	35	35	9	json	[{"pk": 35, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2009	115	100	100	31	json	[{"pk": 100, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - about-us_1.png\\" id=\\"plugin_obj_101\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture - about-us_1.png\\"></p>"}}]	
2010	115	5	5	11	json	[{"pk": 5, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "products.html", "tree_id": 5, "placeholders": [24, 25, 26, 27], "changed_date": "2014-09-08T01:28:18.010Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": null, "creation_date": "2014-09-08T01:25:48.188Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Products
2011	115	5	5	16	json	[{"pk": 5, "model": "cms.title", "fields": {"menu_title": "Products", "meta_description": "", "page_title": "", "language": "en", "title": "Products", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 5, "published": false, "path": "products", "publisher_state": 1, "creation_date": "2014-09-08T01:25:48.269Z", "slug": "products", "publisher_public": null}}]	Products (products, en)
2012	115	25	25	9	json	[{"pk": 25, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2013	115	24	24	9	json	[{"pk": 24, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2014	115	100	100	10	json	[{"pk": 100, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-08T01:29:07.313Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:12:33.888Z", "lft": 1, "tree_id": 45, "position": 0, "placeholder": 25, "plugin_type": "TextPlugin"}}]	100
2015	115	26	26	9	json	[{"pk": 26, "model": "cms.placeholder", "fields": {"slot": "general", "default_width": null}}]	general
2016	115	27	27	9	json	[{"pk": 27, "model": "cms.placeholder", "fields": {"slot": "products", "default_width": null}}]	products
2017	115	101	101	25	json	[{"pk": 101, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/about-us_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	about-us_1.png
2018	115	101	101	10	json	[{"pk": 101, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-08T01:29:07.296Z", "parent": 100, "language": "en", "level": 1, "creation_date": "2014-09-07T23:12:42.336Z", "lft": 2, "tree_id": 45, "position": 0, "placeholder": 25, "plugin_type": "PicturePlugin"}}]	101
2019	116	100	100	31	json	[{"pk": 100, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - about-us_1.png\\" id=\\"plugin_obj_101\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture - about-us_1.png\\"></p>"}}]	
2020	116	5	5	11	json	[{"pk": 5, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "products.html", "tree_id": 5, "placeholders": [24, 25, 26, 27], "changed_date": "2014-09-08T01:29:07.378Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": null, "creation_date": "2014-09-08T01:25:48.188Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Products
2021	116	5	5	16	json	[{"pk": 5, "model": "cms.title", "fields": {"menu_title": "Products", "meta_description": "", "page_title": "", "language": "en", "title": "Products", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 5, "published": false, "path": "products", "publisher_state": 1, "creation_date": "2014-09-08T01:25:48.269Z", "slug": "products", "publisher_public": null}}]	Products (products, en)
2022	116	25	25	9	json	[{"pk": 25, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2023	116	24	24	9	json	[{"pk": 24, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2024	116	100	100	10	json	[{"pk": 100, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-08T01:29:07.313Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:12:33.888Z", "lft": 1, "tree_id": 45, "position": 0, "placeholder": 25, "plugin_type": "TextPlugin"}}]	100
2025	116	26	26	9	json	[{"pk": 26, "model": "cms.placeholder", "fields": {"slot": "general", "default_width": null}}]	general
2026	116	27	27	9	json	[{"pk": 27, "model": "cms.placeholder", "fields": {"slot": "products", "default_width": null}}]	products
2027	116	101	101	25	json	[{"pk": 101, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/5/products-header.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	products-header.png
2028	116	101	101	10	json	[{"pk": 101, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-08T01:30:00.865Z", "parent": 100, "language": "en", "level": 1, "creation_date": "2014-09-07T23:12:42.336Z", "lft": 2, "tree_id": 45, "position": 0, "placeholder": 25, "plugin_type": "PicturePlugin"}}]	101
2029	117	100	100	31	json	[{"pk": 100, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - products-header.png\\" id=\\"plugin_obj_101\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2030	117	5	5	11	json	[{"pk": 5, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "products.html", "tree_id": 5, "placeholders": [24, 25, 26, 27], "changed_date": "2014-09-08T01:30:00.977Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": null, "creation_date": "2014-09-08T01:25:48.188Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Products
2031	117	5	5	16	json	[{"pk": 5, "model": "cms.title", "fields": {"menu_title": "Products", "meta_description": "", "page_title": "", "language": "en", "title": "Products", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 5, "published": false, "path": "products", "publisher_state": 1, "creation_date": "2014-09-08T01:25:48.269Z", "slug": "products", "publisher_public": null}}]	Products (products, en)
2032	117	25	25	9	json	[{"pk": 25, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2033	117	24	24	9	json	[{"pk": 24, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2034	117	100	100	10	json	[{"pk": 100, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-08T01:30:01.632Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:12:33.888Z", "lft": 1, "tree_id": 45, "position": 0, "placeholder": 25, "plugin_type": "TextPlugin"}}]	100
2035	117	26	26	9	json	[{"pk": 26, "model": "cms.placeholder", "fields": {"slot": "general", "default_width": null}}]	general
2036	117	27	27	9	json	[{"pk": 27, "model": "cms.placeholder", "fields": {"slot": "products", "default_width": null}}]	products
2037	117	101	101	25	json	[{"pk": 101, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/5/products-header.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	products-header.png
2038	117	101	101	10	json	[{"pk": 101, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-08T01:30:00.865Z", "parent": 100, "language": "en", "level": 1, "creation_date": "2014-09-07T23:12:42.336Z", "lft": 2, "tree_id": 45, "position": 0, "placeholder": 25, "plugin_type": "PicturePlugin"}}]	101
2731	172	37	37	31	json	[{"pk": 37, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Lube Design</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>A properly designed lubrication system is essential to the long term profitability of a compressor operation. Proper designs keep mechanical wear to a minimum as well as ensure that only the proper amount of lube is consumed. factors such as rod and piston diameters, operating pressures, field conditions, and gas composition all need to be balanced in a proper design. Part of the design process is scientific, part of the design process is rooted in years of experience. Guardient personnel are the best in the industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>On Site Analysis</h2>\\n\\n\\t\\t<p>In situations where a problem is recurring and can\\u2019t seem to be isolated, an on site analysis is the first step in long term resolution. Give us a call and we\\u2019ll be happy to discuss the problem. Sometimes the problem isn\\u2019t as complicated as it seems and can be identified just by talking through it with one of our knowledgeable people.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Lube Design A...
2732	172	8	8	11	json	[{"pk": 8, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 8, "placeholders": [34, 35], "changed_date": "2014-09-14T20:45:08.978Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T20:35:41.020Z", "creation_date": "2014-09-14T20:34:02.734Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Services
2733	172	29	29	31	json	[{"pk": 29, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - services-banner_1.png\\" id=\\"plugin_obj_30\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2734	172	8	8	16	json	[{"pk": 8, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Services", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 8, "published": true, "path": "services", "publisher_state": 1, "creation_date": "2014-09-14T20:34:02.850Z", "slug": "services", "publisher_public": 9}}]	Services (services, en)
2735	172	30	30	25	json	[{"pk": 30, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/services-banner_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	services-banner_1.png
2736	172	29	29	10	json	[{"pk": 29, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:43:21.029Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:34:15.847Z", "lft": 1, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "TextPlugin"}}]	29
2737	172	30	30	10	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:43:17.344Z", "parent": 29, "language": "en", "level": 1, "creation_date": "2014-09-14T20:34:22.410Z", "lft": 2, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	30
2738	172	37	37	10	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T20:46:23.347Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 21, "position": 1, "placeholder": 34, "plugin_type": "TextPlugin"}}]	37
2859	181	30	30	10	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:43:17.344Z", "parent": 29, "language": "en", "level": 1, "creation_date": "2014-09-14T20:34:22.410Z", "lft": 2, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	30
2860	181	37	37	10	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T20:52:49.300Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 21, "position": 1, "placeholder": 34, "plugin_type": "TextPlugin"}}]	37
2893	184	8	8	11	json	[{"pk": 8, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 8, "placeholders": [34, 35], "changed_date": "2014-09-14T21:00:17.197Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T20:35:41.020Z", "creation_date": "2014-09-14T20:34:02.734Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Services
2894	184	29	29	31	json	[{"pk": 29, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - services-banner_1.png\\" id=\\"plugin_obj_30\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2895	184	30	30	25	json	[{"pk": 30, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/services-banner_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	services-banner_1.png
2896	184	34	34	9	json	[{"pk": 34, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2897	184	35	35	9	json	[{"pk": 35, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3003	189	40	40	9	json	[{"pk": 40, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2039	118	100	100	31	json	[{"pk": 100, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - products-header.png\\" id=\\"plugin_obj_101\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2040	118	5	5	11	json	[{"pk": 5, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "products.html", "tree_id": 5, "placeholders": [24, 25, 26, 27], "changed_date": "2014-09-08T01:30:01.738Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": null, "creation_date": "2014-09-08T01:25:48.188Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Products
2041	118	5	5	16	json	[{"pk": 5, "model": "cms.title", "fields": {"menu_title": "Products", "meta_description": "", "page_title": "", "language": "en", "title": "Products", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 5, "published": false, "path": "products", "publisher_state": 1, "creation_date": "2014-09-08T01:25:48.269Z", "slug": "products", "publisher_public": null}}]	Products (products, en)
2042	118	25	25	9	json	[{"pk": 25, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2043	118	24	24	9	json	[{"pk": 24, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2044	118	100	100	10	json	[{"pk": 100, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-08T01:30:24.485Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:12:33.888Z", "lft": 1, "tree_id": 45, "position": 0, "placeholder": 25, "plugin_type": "TextPlugin"}}]	100
1479	90	3	3	16	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "About Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 3, "published": true, "path": "about-us", "publisher_state": 0, "creation_date": "2014-09-07T23:09:31.805Z", "slug": "about-us", "publisher_public": 4}}]	About Us (about-us, en)
1480	90	3	3	11	json	[{"pk": 3, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": false, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 3, "placeholders": [18, 19], "changed_date": "2014-09-07T23:39:53.241Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-07T23:09:52.067Z", "creation_date": "2014-09-07T23:09:31.722Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	About Us
1481	90	68	68	31	json	[{"pk": 68, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - guardiant-truck_1.png\\" id=\\"plugin_obj_70\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
1482	90	69	69	10	json	[{"pk": 69, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:39:22.455Z", "parent": 68, "language": "en", "level": 1, "creation_date": "2014-09-07T23:39:22.447Z", "lft": 2, "tree_id": 33, "position": 0, "placeholder": 18, "plugin_type": "FilePlugin"}}]	69
1483	90	70	70	25	json	[{"pk": 70, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/guardiant-truck_1.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	guardiant-truck_1.png
1484	90	60	60	25	json	[{"pk": 60, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/guardiant-gauges_1.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	guardiant-gauges_1.png
1485	90	70	70	10	json	[{"pk": 70, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-07T23:39:36.493Z", "parent": 68, "language": "en", "level": 1, "creation_date": "2014-09-07T23:39:26.116Z", "lft": 4, "tree_id": 33, "position": 1, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	70
1486	90	18	18	9	json	[{"pk": 18, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
1487	90	19	19	9	json	[{"pk": 19, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
1488	90	52	52	10	json	[{"pk": 52, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-07T23:28:06.734Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:12:33.888Z", "lft": 1, "tree_id": 25, "position": 0, "placeholder": 18, "plugin_type": "TextPlugin"}}]	52
1489	90	53	53	25	json	[{"pk": 53, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/about-us_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	about-us_1.png
1490	90	68	68	10	json	[{"pk": 68, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-07T23:39:48.762Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:39:16.553Z", "lft": 1, "tree_id": 33, "position": 4, "placeholder": 18, "plugin_type": "TextPlugin"}}]	68
1491	90	58	58	31	json	[{"pk": 58, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"about-us-gauges\\">\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Replacement Parts</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Parts manufactured for Guardiant are made with the best materials available and meet the tightest tolerances in the industry. Our highly trained staff is ready to assist you in identifying the exact part you need and getting it into your hands as quickly as possible. We know compressors and we know how to get you rolling again.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li><img title=\\"Picture - guardiant-gauges_1.png\\" id=\\"plugin_obj_60\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Replacement Parts Guardiant...
1492	90	53	53	10	json	[{"pk": 53, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:12:54.627Z", "parent": 52, "language": "en", "level": 1, "creation_date": "2014-09-07T23:12:42.336Z", "lft": 2, "tree_id": 25, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	53
2045	118	26	26	9	json	[{"pk": 26, "model": "cms.placeholder", "fields": {"slot": "general", "default_width": null}}]	general
2046	118	27	27	9	json	[{"pk": 27, "model": "cms.placeholder", "fields": {"slot": "products", "default_width": null}}]	products
2739	173	34	34	9	json	[{"pk": 34, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
1493	90	60	60	10	json	[{"pk": 60, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:28:49.159Z", "parent": 58, "language": "en", "level": 1, "creation_date": "2014-09-07T23:27:37.395Z", "lft": 2, "tree_id": 28, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	60
1494	90	58	58	10	json	[{"pk": 58, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-07T23:32:38.104Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:25:58.378Z", "lft": 1, "tree_id": 28, "position": 2, "placeholder": 18, "plugin_type": "TextPlugin"}}]	58
1495	90	52	52	31	json	[{"pk": 52, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - about-us_1.png\\" id=\\"plugin_obj_53\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>"}}]	
2047	118	101	101	25	json	[{"pk": 101, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/5/products-header.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	products-header.png
2048	118	101	101	10	json	[{"pk": 101, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-08T01:30:00.865Z", "parent": 100, "language": "en", "level": 1, "creation_date": "2014-09-07T23:12:42.336Z", "lft": 2, "tree_id": 45, "position": 0, "placeholder": 25, "plugin_type": "PicturePlugin"}}]	101
2740	173	35	35	9	json	[{"pk": 35, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2741	173	37	37	31	json	[{"pk": 37, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Lube Design</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>A properly designed lubrication system is essential to the long term profitability of a compressor operation. Proper designs keep mechanical wear to a minimum as well as ensure that only the proper amount of lube is consumed. factors such as rod and piston diameters, operating pressures, field conditions, and gas composition all need to be balanced in a proper design. Part of the design process is scientific, part of the design process is rooted in years of experience. Guardient personnel are the best in the industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>On Site Analysis</h2>\\n\\n\\t\\t<p>In situations where a problem is recurring and can\\u2019t seem to be isolated, an on site analysis is the first step in long term resolution. Give us a call and we\\u2019ll be happy to discuss the problem. Sometimes the problem isn\\u2019t as complicated as it seems and can be identified just by talking through it with one of our knowledgeable people.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Lube Design A...
2742	173	38	38	10	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T20:47:30.739Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:47:30.733Z", "lft": 1, "tree_id": 22, "position": 3, "placeholder": 34, "plugin_type": "TextPlugin"}}]	38
2743	173	8	8	11	json	[{"pk": 8, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 8, "placeholders": [34, 35], "changed_date": "2014-09-14T20:46:23.467Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T20:35:41.020Z", "creation_date": "2014-09-14T20:34:02.734Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Services
2744	173	29	29	31	json	[{"pk": 29, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - services-banner_1.png\\" id=\\"plugin_obj_30\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2745	173	8	8	16	json	[{"pk": 8, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Services", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 8, "published": true, "path": "services", "publisher_state": 1, "creation_date": "2014-09-14T20:34:02.850Z", "slug": "services", "publisher_public": 9}}]	Services (services, en)
2746	173	30	30	25	json	[{"pk": 30, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/services-banner_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	services-banner_1.png
2747	173	29	29	10	json	[{"pk": 29, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:43:21.029Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:34:15.847Z", "lft": 1, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "TextPlugin"}}]	29
2748	173	30	30	10	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:43:17.344Z", "parent": 29, "language": "en", "level": 1, "creation_date": "2014-09-14T20:34:22.410Z", "lft": 2, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	30
2749	173	37	37	10	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T20:46:23.347Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 21, "position": 1, "placeholder": 34, "plugin_type": "TextPlugin"}}]	37
2861	182	34	34	9	json	[{"pk": 34, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2862	182	35	35	9	json	[{"pk": 35, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2863	182	37	37	31	json	[{"pk": 37, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"two-up-light\\">\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Lube Design</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>A properly designed lubrication system is essential to the long term profitability of a compressor operation. Proper designs keep mechanical wear to a minimum as well as ensure that only the proper amount of lube is consumed. factors such as rod and piston diameters, operating pressures, field conditions, and gas composition all need to be balanced in a proper design. Part of the design process is scientific, part of the design process is rooted in years of experience. Guardient personnel are the best in the industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>On Site Analysis</h2>\\n\\n\\t\\t<p>In situations where a problem is recurring and can\\u2019t seem to be isolated, an on site analysis is the first step in long term resolution. Give us a call and we\\u2019ll be happy to discuss the problem. Sometimes the problem isn\\u2019t as complicated as it seems and can be identified just by talking through it with one of our knowledgeable people.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Lube Design A...
3007	190	40	40	9	json	[{"pk": 40, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2049	119	100	100	31	json	[{"pk": 100, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - products-header.png\\" id=\\"plugin_obj_101\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2050	119	5	5	11	json	[{"pk": 5, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "products.html", "tree_id": 5, "placeholders": [24, 25, 26, 27], "changed_date": "2014-09-08T01:30:24.545Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": null, "creation_date": "2014-09-08T01:25:48.188Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Products
2051	119	104	104	31	json	[{"pk": 104, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"about-us-gauges bb3\\">\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Replacement Parts</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Parts manufactured for Guardiant are made with the best materials available and meet the tightest tolerances in the industry. Our highly trained staff is ready to assist you in identifying the exact part you need and getting it into your hands as quickly as possible. We know compressors and we know how to get you rolling again.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li><img title=\\"Picture - guardiant-gauges_1.png\\" id=\\"plugin_obj_105\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture - guardiant-gauges_1.png\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Replacement Parts Guardiant...
2052	119	105	105	25	json	[{"pk": 105, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/guardiant-gauges_1.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	guardiant-gauges_1.png
2053	119	5	5	16	json	[{"pk": 5, "model": "cms.title", "fields": {"menu_title": "Products", "meta_description": "", "page_title": "", "language": "en", "title": "Products", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 5, "published": false, "path": "products", "publisher_state": 1, "creation_date": "2014-09-08T01:25:48.269Z", "slug": "products", "publisher_public": null}}]	Products (products, en)
2054	119	104	104	10	json	[{"pk": 104, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-08T01:33:14.179Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:25:58.378Z", "lft": 1, "tree_id": 47, "position": 1, "placeholder": 26, "plugin_type": "TextPlugin"}}]	104
2055	119	25	25	9	json	[{"pk": 25, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2056	119	105	105	10	json	[{"pk": 105, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-08T01:33:14.105Z", "parent": 104, "language": "en", "level": 1, "creation_date": "2014-09-07T23:27:37.395Z", "lft": 2, "tree_id": 47, "position": 0, "placeholder": 26, "plugin_type": "PicturePlugin"}}]	105
2057	119	24	24	9	json	[{"pk": 24, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2058	119	100	100	10	json	[{"pk": 100, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-08T01:30:24.485Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:12:33.888Z", "lft": 1, "tree_id": 45, "position": 0, "placeholder": 25, "plugin_type": "TextPlugin"}}]	100
2059	119	26	26	9	json	[{"pk": 26, "model": "cms.placeholder", "fields": {"slot": "general", "default_width": null}}]	general
2060	119	27	27	9	json	[{"pk": 27, "model": "cms.placeholder", "fields": {"slot": "products", "default_width": null}}]	products
2061	119	101	101	25	json	[{"pk": 101, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/5/products-header.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	products-header.png
2062	119	101	101	10	json	[{"pk": 101, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-08T01:30:00.865Z", "parent": 100, "language": "en", "level": 1, "creation_date": "2014-09-07T23:12:42.336Z", "lft": 2, "tree_id": 45, "position": 0, "placeholder": 25, "plugin_type": "PicturePlugin"}}]	101
2063	120	100	100	31	json	[{"pk": 100, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - products-header.png\\" id=\\"plugin_obj_101\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2064	120	5	5	11	json	[{"pk": 5, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "products.html", "tree_id": 5, "placeholders": [24, 25, 26, 27], "changed_date": "2014-09-08T01:33:14.247Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": null, "creation_date": "2014-09-08T01:25:48.188Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Products
2065	120	104	104	31	json	[{"pk": 104, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"about-us-gauges bb3\\">\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Replacement Parts</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Parts manufactured for Guardiant are made with the best materials available and meet the tightest tolerances in the industry. Our highly trained staff is ready to assist you in identifying the exact part you need and getting it into your hands as quickly as possible. We know compressors and we know how to get you rolling again.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li><img title=\\"Picture - guardiant-gauges_1.png\\" id=\\"plugin_obj_105\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture - guardiant-gauges_1.png\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Replacement Parts Guardiant...
2066	120	105	105	25	json	[{"pk": 105, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/5/guardiant-screw.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	guardiant-screw.png
2067	120	5	5	16	json	[{"pk": 5, "model": "cms.title", "fields": {"menu_title": "Products", "meta_description": "", "page_title": "", "language": "en", "title": "Products", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 5, "published": false, "path": "products", "publisher_state": 1, "creation_date": "2014-09-08T01:25:48.269Z", "slug": "products", "publisher_public": null}}]	Products (products, en)
2750	174	34	34	9	json	[{"pk": 34, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2068	120	104	104	10	json	[{"pk": 104, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-08T01:33:14.179Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:25:58.378Z", "lft": 1, "tree_id": 47, "position": 1, "placeholder": 26, "plugin_type": "TextPlugin"}}]	104
2069	120	25	25	9	json	[{"pk": 25, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2070	120	105	105	10	json	[{"pk": 105, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-08T01:34:25.473Z", "parent": 104, "language": "en", "level": 1, "creation_date": "2014-09-07T23:27:37.395Z", "lft": 2, "tree_id": 47, "position": 0, "placeholder": 26, "plugin_type": "PicturePlugin"}}]	105
2071	120	24	24	9	json	[{"pk": 24, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2072	120	100	100	10	json	[{"pk": 100, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-08T01:30:24.485Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:12:33.888Z", "lft": 1, "tree_id": 45, "position": 0, "placeholder": 25, "plugin_type": "TextPlugin"}}]	100
2073	120	26	26	9	json	[{"pk": 26, "model": "cms.placeholder", "fields": {"slot": "general", "default_width": null}}]	general
2074	120	27	27	9	json	[{"pk": 27, "model": "cms.placeholder", "fields": {"slot": "products", "default_width": null}}]	products
2075	120	101	101	25	json	[{"pk": 101, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/5/products-header.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	products-header.png
2076	120	101	101	10	json	[{"pk": 101, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-08T01:30:00.865Z", "parent": 100, "language": "en", "level": 1, "creation_date": "2014-09-07T23:12:42.336Z", "lft": 2, "tree_id": 45, "position": 0, "placeholder": 25, "plugin_type": "PicturePlugin"}}]	101
2751	174	35	35	9	json	[{"pk": 35, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2752	174	37	37	31	json	[{"pk": 37, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Lube Design</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>A properly designed lubrication system is essential to the long term profitability of a compressor operation. Proper designs keep mechanical wear to a minimum as well as ensure that only the proper amount of lube is consumed. factors such as rod and piston diameters, operating pressures, field conditions, and gas composition all need to be balanced in a proper design. Part of the design process is scientific, part of the design process is rooted in years of experience. Guardient personnel are the best in the industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>On Site Analysis</h2>\\n\\n\\t\\t<p>In situations where a problem is recurring and can\\u2019t seem to be isolated, an on site analysis is the first step in long term resolution. Give us a call and we\\u2019ll be happy to discuss the problem. Sometimes the problem isn\\u2019t as complicated as it seems and can be identified just by talking through it with one of our knowledgeable people.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Lube Design A...
2753	174	38	38	10	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:47:30.739Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:47:30.733Z", "lft": 1, "tree_id": 22, "position": 3, "placeholder": 34, "plugin_type": "TextPlugin"}}]	38
2754	174	39	39	10	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:47:36.495Z", "parent": 38, "language": "en", "level": 1, "creation_date": "2014-09-14T20:47:36.482Z", "lft": 2, "tree_id": 22, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	39
2755	174	8	8	11	json	[{"pk": 8, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 8, "placeholders": [34, 35], "changed_date": "2014-09-14T20:47:30.816Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T20:35:41.020Z", "creation_date": "2014-09-14T20:34:02.734Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Services
2756	174	29	29	31	json	[{"pk": 29, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - services-banner_1.png\\" id=\\"plugin_obj_30\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2757	174	8	8	16	json	[{"pk": 8, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Services", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 8, "published": true, "path": "services", "publisher_state": 1, "creation_date": "2014-09-14T20:34:02.850Z", "slug": "services", "publisher_public": 9}}]	Services (services, en)
2758	174	30	30	25	json	[{"pk": 30, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/services-banner_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	services-banner_1.png
2759	174	29	29	10	json	[{"pk": 29, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:43:21.029Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:34:15.847Z", "lft": 1, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "TextPlugin"}}]	29
2760	174	30	30	10	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:43:17.344Z", "parent": 29, "language": "en", "level": 1, "creation_date": "2014-09-14T20:34:22.410Z", "lft": 2, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	30
2761	174	37	37	10	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T20:46:23.347Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 21, "position": 1, "placeholder": 34, "plugin_type": "TextPlugin"}}]	37
2864	182	38	38	31	json	[{"pk": 38, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - service-trucks.png\\" id=\\"plugin_obj_39\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2865	182	39	39	25	json	[{"pk": 39, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/service-trucks.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	service-trucks.png
3012	191	39	39	9	json	[{"pk": 39, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2077	121	100	100	31	json	[{"pk": 100, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - products-header.png\\" id=\\"plugin_obj_101\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2078	121	5	5	11	json	[{"pk": 5, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "products.html", "tree_id": 5, "placeholders": [24, 25, 26, 27], "changed_date": "2014-09-08T01:34:25.603Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": null, "creation_date": "2014-09-08T01:25:48.188Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Products
2079	121	104	104	31	json	[{"pk": 104, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"about-us-gauges bb3\\">\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>OVERVIEW</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant is committed to supplying high quality parts as quickly as possible. Our warehouse is kept stocked and in almost all cases, we can fulfill your requests immediately. Because parts can be highly configurable or cosmetically similar but functionally different, we always suggest that you talk with our staff before ordering. Our staff members are highly trained and have years of experience in the lubrication field.\\u00a0</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li><img title=\\"Picture - guardiant-screw.png\\" id=\\"plugin_obj_105\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	OVERVIEW Guardiant is...
2080	121	105	105	25	json	[{"pk": 105, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/5/guardiant-screw.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	guardiant-screw.png
2081	121	5	5	16	json	[{"pk": 5, "model": "cms.title", "fields": {"menu_title": "Products", "meta_description": "", "page_title": "", "language": "en", "title": "Products", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 5, "published": false, "path": "products", "publisher_state": 1, "creation_date": "2014-09-08T01:25:48.269Z", "slug": "products", "publisher_public": null}}]	Products (products, en)
2082	121	104	104	10	json	[{"pk": 104, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-08T01:34:55.963Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:25:58.378Z", "lft": 1, "tree_id": 47, "position": 1, "placeholder": 26, "plugin_type": "TextPlugin"}}]	104
2083	121	25	25	9	json	[{"pk": 25, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2084	121	105	105	10	json	[{"pk": 105, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-08T01:34:25.473Z", "parent": 104, "language": "en", "level": 1, "creation_date": "2014-09-07T23:27:37.395Z", "lft": 2, "tree_id": 47, "position": 0, "placeholder": 26, "plugin_type": "PicturePlugin"}}]	105
2085	121	24	24	9	json	[{"pk": 24, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2086	121	100	100	10	json	[{"pk": 100, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-08T01:30:24.485Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:12:33.888Z", "lft": 1, "tree_id": 45, "position": 0, "placeholder": 25, "plugin_type": "TextPlugin"}}]	100
2087	121	26	26	9	json	[{"pk": 26, "model": "cms.placeholder", "fields": {"slot": "general", "default_width": null}}]	general
2088	121	27	27	9	json	[{"pk": 27, "model": "cms.placeholder", "fields": {"slot": "products", "default_width": null}}]	products
2089	121	101	101	25	json	[{"pk": 101, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/5/products-header.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	products-header.png
2090	121	101	101	10	json	[{"pk": 101, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-08T01:30:00.865Z", "parent": 100, "language": "en", "level": 1, "creation_date": "2014-09-07T23:12:42.336Z", "lft": 2, "tree_id": 45, "position": 0, "placeholder": 25, "plugin_type": "PicturePlugin"}}]	101
2091	122	100	100	31	json	[{"pk": 100, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - products-header.png\\" id=\\"plugin_obj_101\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2092	122	5	5	11	json	[{"pk": 5, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "products.html", "tree_id": 5, "placeholders": [24, 25, 26, 27], "changed_date": "2014-09-08T01:35:10.759Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-08T01:35:10.386Z", "creation_date": "2014-09-08T01:25:48.188Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Products
2093	122	104	104	31	json	[{"pk": 104, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"about-us-gauges bb3\\">\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>OVERVIEW</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant is committed to supplying high quality parts as quickly as possible. Our warehouse is kept stocked and in almost all cases, we can fulfill your requests immediately. Because parts can be highly configurable or cosmetically similar but functionally different, we always suggest that you talk with our staff before ordering. Our staff members are highly trained and have years of experience in the lubrication field.\\u00a0</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li><img title=\\"Picture - guardiant-screw.png\\" id=\\"plugin_obj_105\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	OVERVIEW Guardiant is...
2094	122	105	105	25	json	[{"pk": 105, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/5/guardiant-screw.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	guardiant-screw.png
2095	122	5	5	16	json	[{"pk": 5, "model": "cms.title", "fields": {"menu_title": "Products", "meta_description": "", "page_title": "", "language": "en", "title": "Products", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 5, "published": true, "path": "products", "publisher_state": 0, "creation_date": "2014-09-08T01:25:48.269Z", "slug": "products", "publisher_public": 6}}]	Products (products, en)
2762	175	34	34	9	json	[{"pk": 34, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2096	122	104	104	10	json	[{"pk": 104, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-08T01:34:55.963Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:25:58.378Z", "lft": 1, "tree_id": 47, "position": 1, "placeholder": 26, "plugin_type": "TextPlugin"}}]	104
2097	122	25	25	9	json	[{"pk": 25, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2098	122	105	105	10	json	[{"pk": 105, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-08T01:34:25.473Z", "parent": 104, "language": "en", "level": 1, "creation_date": "2014-09-07T23:27:37.395Z", "lft": 2, "tree_id": 47, "position": 0, "placeholder": 26, "plugin_type": "PicturePlugin"}}]	105
2099	122	24	24	9	json	[{"pk": 24, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2100	122	100	100	10	json	[{"pk": 100, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-08T01:30:24.485Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:12:33.888Z", "lft": 1, "tree_id": 45, "position": 0, "placeholder": 25, "plugin_type": "TextPlugin"}}]	100
2101	122	26	26	9	json	[{"pk": 26, "model": "cms.placeholder", "fields": {"slot": "general", "default_width": null}}]	general
2102	122	27	27	9	json	[{"pk": 27, "model": "cms.placeholder", "fields": {"slot": "products", "default_width": null}}]	products
2103	122	101	101	25	json	[{"pk": 101, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/5/products-header.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	products-header.png
2104	122	101	101	10	json	[{"pk": 101, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-08T01:30:00.865Z", "parent": 100, "language": "en", "level": 1, "creation_date": "2014-09-07T23:12:42.336Z", "lft": 2, "tree_id": 45, "position": 0, "placeholder": 25, "plugin_type": "PicturePlugin"}}]	101
2763	175	35	35	9	json	[{"pk": 35, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2764	175	37	37	31	json	[{"pk": 37, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Lube Design</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>A properly designed lubrication system is essential to the long term profitability of a compressor operation. Proper designs keep mechanical wear to a minimum as well as ensure that only the proper amount of lube is consumed. factors such as rod and piston diameters, operating pressures, field conditions, and gas composition all need to be balanced in a proper design. Part of the design process is scientific, part of the design process is rooted in years of experience. Guardient personnel are the best in the industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>On Site Analysis</h2>\\n\\n\\t\\t<p>In situations where a problem is recurring and can\\u2019t seem to be isolated, an on site analysis is the first step in long term resolution. Give us a call and we\\u2019ll be happy to discuss the problem. Sometimes the problem isn\\u2019t as complicated as it seems and can be identified just by talking through it with one of our knowledgeable people.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Lube Design A...
2765	175	38	38	10	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:47:30.739Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:47:30.733Z", "lft": 1, "tree_id": 22, "position": 3, "placeholder": 34, "plugin_type": "TextPlugin"}}]	38
2766	175	39	39	25	json	[{"pk": 39, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/service-trucks.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	service-trucks.png
2767	175	8	8	11	json	[{"pk": 8, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 8, "placeholders": [34, 35], "changed_date": "2014-09-14T20:47:36.565Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T20:35:41.020Z", "creation_date": "2014-09-14T20:34:02.734Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Services
2768	175	39	39	10	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:47:45.231Z", "parent": 38, "language": "en", "level": 1, "creation_date": "2014-09-14T20:47:36.482Z", "lft": 2, "tree_id": 22, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	39
2769	175	29	29	31	json	[{"pk": 29, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - services-banner_1.png\\" id=\\"plugin_obj_30\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2770	175	8	8	16	json	[{"pk": 8, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Services", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 8, "published": true, "path": "services", "publisher_state": 1, "creation_date": "2014-09-14T20:34:02.850Z", "slug": "services", "publisher_public": 9}}]	Services (services, en)
2771	175	30	30	25	json	[{"pk": 30, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/services-banner_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	services-banner_1.png
2772	175	29	29	10	json	[{"pk": 29, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:43:21.029Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:34:15.847Z", "lft": 1, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "TextPlugin"}}]	29
3994	263	4	4	31	json	[{"pk": 4, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHO WE ARE</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems is a privately owned company dedicated to serving the needs of the gas \\u0003transmission industry. Guardiant's core principle is to always do the next right thing. Our mission is to be the leading lubrication systems company in this industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHAT WE DO</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems services the gas transmission industry for all it\\u2019s lubrication needs. We sell the finest parts available, service existing systems, design new lubrication systems, and provide state of the art training programs. At Guardiant, we are never satisfied with the way it\\u2019s always been done. We believe stagnation in design is moving backwards.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	WHO WE ARE...
3995	263	6	6	9	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content
3996	263	7	7	9	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "mission_content", "default_width": null}}]	mission_content
3997	263	8	8	9	json	[{"pk": 8, "model": "cms.placeholder", "fields": {"slot": "quote_content", "default_width": null}}]	quote_content
3998	263	9	9	9	json	[{"pk": 9, "model": "cms.placeholder", "fields": {"slot": "creto_content", "default_width": null}}]	creto_content
3999	263	10	10	9	json	[{"pk": 10, "model": "cms.placeholder", "fields": {"slot": "grid_content", "default_width": null}}]	grid_content
4000	263	11	11	9	json	[{"pk": 11, "model": "cms.placeholder", "fields": {"slot": "help_content", "default_width": null}}]	help_content
4001	263	12	12	28	json	[{"pk": 12, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact Us", "url": "", "page_link": null, "phone": "", "anchor": "", "target": ""}}]	Contact Us
4002	263	13	13	28	json	[{"pk": 13, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
4003	263	12	12	10	json	[{"pk": 12, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T19:59:14.136Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:58:57.858Z", "lft": 2, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	12
4004	263	8	8	10	json	[{"pk": 8, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:48:42.335Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:48:23.267Z", "lft": 1, "tree_id": 5, "position": 0, "placeholder": 9, "plugin_type": "TextPlugin"}}]	8
4005	263	11	11	10	json	[{"pk": 11, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-14T19:59:31.307Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:51:07.209Z", "lft": 1, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "TextPlugin"}}]	11
4006	263	11	11	31	json	[{"pk": 11, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact Us\\" id=\\"plugin_obj_12\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_13\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
4007	263	13	13	10	json	[{"pk": 13, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-14T19:59:29.618Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:59:18.874Z", "lft": 4, "tree_id": 6, "position": 1, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	13
4008	263	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": "", "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-09-02T00:20:41.372Z", "slug": "home", "publisher_public": 2}}]	Home (home, en)
4009	263	8	8	31	json	[{"pk": 8, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li>\\n\\t<ul>\\n\\t\\t<li class=\\"title\\">Our Leadership</li>\\n\\t\\t<li class=\\"meaning\\">The leadership at Guardiant is headed up by Scott Roys who brings the same innovative and customer centric philosophy that he learned from his father Curtis Roys at CCT. The entire staff is peppered with familiar faces that will remind many people of the way lubrication system services have been and should be run!</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Our Leadership The...
4010	263	4	4	10	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:30:52.388Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 2, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	4
4011	263	170	170	10	json	[{"pk": 170, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-23T22:08:51.825Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-23T22:08:51.819Z", "lft": 1, "tree_id": 52, "position": 0, "placeholder": 6, "plugin_type": "CMSImageGalleryPlugin"}}]	170
1828	107	3	3	11	json	[{"pk": 3, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": false, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "template_1.html", "tree_id": 2, "placeholders": [18, 19], "changed_date": "2014-09-08T00:02:52.884Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-07T23:09:52.067Z", "creation_date": "2014-09-07T23:09:31.722Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	About Us
1829	107	86	86	31	json	[{"pk": 86, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"about-us-gauges bb3\\">\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\u200b<img title=\\"Picture - services-guard.png\\" id=\\"plugin_obj_87\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></li>\\n\\t</ul>\\n\\t</li>\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Services</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. Our rapid response team is here 24/7 365 and we are global in scope. Additionally, Guardiant studies the trends in preventive maintenance and uses that information to develop methodology for true predictive maintenance. We can help you get from the costly reactive maintenvance cycle into a cost effective preventative maintenance plan. Imagine operations where the only downtime is the one you planned for.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	​ Services Guardiant...
1848	107	87	87	10	json	[{"pk": 87, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:54:24.623Z", "parent": 86, "language": "en", "level": 1, "creation_date": "2014-09-07T23:27:37.395Z", "lft": 2, "tree_id": 38, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	87
1849	107	58	58	31	json	[{"pk": 58, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"about-us-gauges bb3\\">\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Replacement Parts</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Parts manufactured for Guardiant are made with the best materials available and meet the tightest tolerances in the industry. Our highly trained staff is ready to assist you in identifying the exact part you need and getting it into your hands as quickly as possible. We know compressors and we know how to get you rolling again.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li><img title=\\"Picture - guardiant-gauges_1.png\\" id=\\"plugin_obj_60\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Replacement Parts Guardiant...
1850	107	94	94	10	json	[{"pk": 94, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:55:40.574Z", "parent": 93, "language": "en", "level": 1, "creation_date": "2014-09-07T19:53:34.346Z", "lft": 2, "tree_id": 42, "position": 0, "placeholder": 18, "plugin_type": "LinkPlugin"}}]	94
1851	107	95	95	10	json	[{"pk": 95, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-07T23:55:40.579Z", "parent": 93, "language": "en", "level": 1, "creation_date": "2014-09-07T19:53:41.617Z", "lft": 4, "tree_id": 42, "position": 1, "placeholder": 18, "plugin_type": "LinkPlugin"}}]	95
1852	107	3	3	16	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "About Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 3, "published": true, "path": "about-us", "publisher_state": 1, "creation_date": "2014-09-07T23:09:31.805Z", "slug": "about-us", "publisher_public": 4}}]	About Us (about-us, en)
1853	107	60	60	25	json	[{"pk": 60, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/guardiant-gauges_1.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	guardiant-gauges_1.png
1854	107	93	93	10	json	[{"pk": 93, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-08T00:02:52.852Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T19:38:55.995Z", "lft": 1, "tree_id": 42, "position": 4, "placeholder": 18, "plugin_type": "TextPlugin"}}]	93
1855	108	3	3	11	json	[{"pk": 3, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": false, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "template_1.html", "tree_id": 2, "placeholders": [18, 19], "changed_date": "2014-09-08T00:02:53.025Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-07T23:09:52.067Z", "creation_date": "2014-09-07T23:09:31.722Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	About Us
1856	108	86	86	31	json	[{"pk": 86, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"about-us-gauges bb3\\">\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\u200b<img title=\\"Picture - services-guard.png\\" id=\\"plugin_obj_87\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></li>\\n\\t</ul>\\n\\t</li>\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Services</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. Our rapid response team is here 24/7 365 and we are global in scope. Additionally, Guardiant studies the trends in preventive maintenance and uses that information to develop methodology for true predictive maintenance. We can help you get from the costly reactive maintenvance cycle into a cost effective preventative maintenance plan. Imagine operations where the only downtime is the one you planned for.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	​ Services Guardiant...
1857	108	87	87	25	json	[{"pk": 87, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/services-guard.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	services-guard.png
1858	108	94	94	28	json	[{"pk": 94, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact us", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Contact us
1859	108	18	18	9	json	[{"pk": 18, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
1860	108	19	19	9	json	[{"pk": 19, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
1861	108	68	68	31	json	[{"pk": 68, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - guardiant-truck_1.png\\" id=\\"plugin_obj_70\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
1862	108	70	70	25	json	[{"pk": 70, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/guardiant-truck_1.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	guardiant-truck_1.png
1863	108	93	93	31	json	[{"pk": 93, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"help-container\\">\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact us\\" id=\\"plugin_obj_94\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link - Contact us\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_95\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link - Find a distributor\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
1864	108	52	52	10	json	[{"pk": 52, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-07T23:55:40.597Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:12:33.888Z", "lft": 1, "tree_id": 25, "position": 0, "placeholder": 18, "plugin_type": "TextPlugin"}}]	52
1865	108	53	53	25	json	[{"pk": 53, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/about-us_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	about-us_1.png
1867	108	58	58	10	json	[{"pk": 58, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-07T23:55:40.605Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:25:58.378Z", "lft": 1, "tree_id": 28, "position": 1, "placeholder": 18, "plugin_type": "TextPlugin"}}]	58
1868	108	95	95	28	json	[{"pk": 95, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
1869	108	60	60	10	json	[{"pk": 60, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:51:40.662Z", "parent": 58, "language": "en", "level": 1, "creation_date": "2014-09-07T23:27:37.395Z", "lft": 2, "tree_id": 28, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	60
1870	108	53	53	10	json	[{"pk": 53, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:12:54.627Z", "parent": 52, "language": "en", "level": 1, "creation_date": "2014-09-07T23:12:42.336Z", "lft": 2, "tree_id": 25, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	53
1871	108	68	68	10	json	[{"pk": 68, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-07T23:55:40.614Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:39:16.553Z", "lft": 1, "tree_id": 33, "position": 2, "placeholder": 18, "plugin_type": "TextPlugin"}}]	68
1872	108	69	69	10	json	[{"pk": 69, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:50:38.241Z", "parent": 68, "language": "en", "level": 1, "creation_date": "2014-09-07T23:39:22.447Z", "lft": 2, "tree_id": 33, "position": 0, "placeholder": 18, "plugin_type": "FilePlugin"}}]	69
1873	108	70	70	10	json	[{"pk": 70, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-07T23:50:38.248Z", "parent": 68, "language": "en", "level": 1, "creation_date": "2014-09-07T23:39:26.116Z", "lft": 4, "tree_id": 33, "position": 1, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	70
1874	108	86	86	10	json	[{"pk": 86, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-07T23:55:40.632Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:25:58.378Z", "lft": 1, "tree_id": 38, "position": 3, "placeholder": 18, "plugin_type": "TextPlugin"}}]	86
1875	108	87	87	10	json	[{"pk": 87, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:54:24.623Z", "parent": 86, "language": "en", "level": 1, "creation_date": "2014-09-07T23:27:37.395Z", "lft": 2, "tree_id": 38, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	87
1876	108	58	58	31	json	[{"pk": 58, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"about-us-gauges bb3\\">\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Replacement Parts</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Parts manufactured for Guardiant are made with the best materials available and meet the tightest tolerances in the industry. Our highly trained staff is ready to assist you in identifying the exact part you need and getting it into your hands as quickly as possible. We know compressors and we know how to get you rolling again.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li><img title=\\"Picture - guardiant-gauges_1.png\\" id=\\"plugin_obj_60\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Replacement Parts Guardiant...
1877	108	94	94	10	json	[{"pk": 94, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:55:40.574Z", "parent": 93, "language": "en", "level": 1, "creation_date": "2014-09-07T19:53:34.346Z", "lft": 2, "tree_id": 42, "position": 0, "placeholder": 18, "plugin_type": "LinkPlugin"}}]	94
1878	108	95	95	10	json	[{"pk": 95, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-07T23:55:40.579Z", "parent": 93, "language": "en", "level": 1, "creation_date": "2014-09-07T19:53:41.617Z", "lft": 4, "tree_id": 42, "position": 1, "placeholder": 18, "plugin_type": "LinkPlugin"}}]	95
1879	108	3	3	16	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "About Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 3, "published": true, "path": "about-us", "publisher_state": 1, "creation_date": "2014-09-07T23:09:31.805Z", "slug": "about-us", "publisher_public": 4}}]	About Us (about-us, en)
1880	108	97	97	10	json	[{"pk": 97, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-08T00:04:27.528Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-08T00:04:27.520Z", "lft": 1, "tree_id": 43, "position": 12, "placeholder": 18, "plugin_type": "TextPlugin"}}]	97
1881	108	60	60	25	json	[{"pk": 60, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/guardiant-gauges_1.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	guardiant-gauges_1.png
1882	108	93	93	10	json	[{"pk": 93, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-08T00:02:52.852Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T19:38:55.995Z", "lft": 1, "tree_id": 42, "position": 4, "placeholder": 18, "plugin_type": "TextPlugin"}}]	93
1883	109	3	3	11	json	[{"pk": 3, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": false, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "template_1.html", "tree_id": 2, "placeholders": [18, 19], "changed_date": "2014-09-08T00:04:27.624Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-07T23:09:52.067Z", "creation_date": "2014-09-07T23:09:31.722Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	About Us
1884	109	86	86	31	json	[{"pk": 86, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"about-us-gauges bb3\\">\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\u200b<img title=\\"Picture - services-guard.png\\" id=\\"plugin_obj_87\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></li>\\n\\t</ul>\\n\\t</li>\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Services</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. Our rapid response team is here 24/7 365 and we are global in scope. Additionally, Guardiant studies the trends in preventive maintenance and uses that information to develop methodology for true predictive maintenance. We can help you get from the costly reactive maintenvance cycle into a cost effective preventative maintenance plan. Imagine operations where the only downtime is the one you planned for.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	​ Services Guardiant...
3013	191	40	40	9	json	[{"pk": 40, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
1885	109	87	87	10	json	[{"pk": 87, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:54:24.623Z", "parent": 86, "language": "en", "level": 1, "creation_date": "2014-09-07T23:27:37.395Z", "lft": 2, "tree_id": 38, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	87
1886	109	94	94	28	json	[{"pk": 94, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact us", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Contact us
1887	109	18	18	9	json	[{"pk": 18, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
1888	109	19	19	9	json	[{"pk": 19, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
1889	109	68	68	31	json	[{"pk": 68, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - guardiant-truck_1.png\\" id=\\"plugin_obj_70\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
1890	109	70	70	25	json	[{"pk": 70, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/guardiant-truck_1.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	guardiant-truck_1.png
1891	109	93	93	31	json	[{"pk": 93, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"help-container\\">\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact us\\" id=\\"plugin_obj_94\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link - Contact us\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_95\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link - Find a distributor\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
1892	109	52	52	10	json	[{"pk": 52, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-07T23:55:40.597Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:12:33.888Z", "lft": 1, "tree_id": 25, "position": 0, "placeholder": 18, "plugin_type": "TextPlugin"}}]	52
1893	109	53	53	25	json	[{"pk": 53, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/about-us_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	about-us_1.png
1894	109	52	52	31	json	[{"pk": 52, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - about-us_1.png\\" id=\\"plugin_obj_53\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>"}}]	
1895	109	58	58	10	json	[{"pk": 58, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-07T23:55:40.605Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:25:58.378Z", "lft": 1, "tree_id": 28, "position": 1, "placeholder": 18, "plugin_type": "TextPlugin"}}]	58
1896	109	95	95	28	json	[{"pk": 95, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
1897	109	60	60	10	json	[{"pk": 60, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:51:40.662Z", "parent": 58, "language": "en", "level": 1, "creation_date": "2014-09-07T23:27:37.395Z", "lft": 2, "tree_id": 28, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	60
1898	109	53	53	10	json	[{"pk": 53, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:12:54.627Z", "parent": 52, "language": "en", "level": 1, "creation_date": "2014-09-07T23:12:42.336Z", "lft": 2, "tree_id": 25, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	53
1899	109	68	68	10	json	[{"pk": 68, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-07T23:55:40.614Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:39:16.553Z", "lft": 1, "tree_id": 33, "position": 2, "placeholder": 18, "plugin_type": "TextPlugin"}}]	68
1900	109	69	69	10	json	[{"pk": 69, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:50:38.241Z", "parent": 68, "language": "en", "level": 1, "creation_date": "2014-09-07T23:39:22.447Z", "lft": 2, "tree_id": 33, "position": 0, "placeholder": 18, "plugin_type": "FilePlugin"}}]	69
1901	109	70	70	10	json	[{"pk": 70, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-07T23:50:38.248Z", "parent": 68, "language": "en", "level": 1, "creation_date": "2014-09-07T23:39:26.116Z", "lft": 4, "tree_id": 33, "position": 1, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	70
1902	109	97	97	31	json	[{"pk": 97, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"definition-with-quote\\">\\n\\t<li>\\u00a0\\n\\t<ul class=\\"definition\\">\\n\\t\\t<li>Training</li>\\n\\t\\t<li>When your work force is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill the need. Guardiant trainers have extensive backgrounds in compressor maintenance and are excellent teachers. High end training aids such as animated videos, comprehensive manuals, and hands on training ensure you get the most effective use of your training dollars.\\u00a0</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li>\\u00a0\\n\\t<ul class=\\"quote\\">\\n\\t\\t<li>\\u201c We believe that excellent training will propel this industry forward. We want to be your asset to help in the field, classroom or even providing assistance with our 24/7/365 \\u0003service line.\\u201d</li>\\n\\t\\t<li class=\\"whom\\">Scott Roys</li>\\n\\t</ul>\\n\\t</li>\\n</ul>"}}]	Training When your...
1903	109	86	86	10	json	[{"pk": 86, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-07T23:55:40.632Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:25:58.378Z", "lft": 1, "tree_id": 38, "position": 3, "placeholder": 18, "plugin_type": "TextPlugin"}}]	86
1904	109	87	87	25	json	[{"pk": 87, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/services-guard.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	services-guard.png
1924	110	58	58	10	json	[{"pk": 58, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-07T23:55:40.605Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:25:58.378Z", "lft": 1, "tree_id": 28, "position": 1, "placeholder": 18, "plugin_type": "TextPlugin"}}]	58
1925	110	95	95	28	json	[{"pk": 95, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
1905	109	58	58	31	json	[{"pk": 58, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"about-us-gauges bb3\\">\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Replacement Parts</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Parts manufactured for Guardiant are made with the best materials available and meet the tightest tolerances in the industry. Our highly trained staff is ready to assist you in identifying the exact part you need and getting it into your hands as quickly as possible. We know compressors and we know how to get you rolling again.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li><img title=\\"Picture - guardiant-gauges_1.png\\" id=\\"plugin_obj_60\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Replacement Parts Guardiant...
1906	109	94	94	10	json	[{"pk": 94, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:55:40.574Z", "parent": 93, "language": "en", "level": 1, "creation_date": "2014-09-07T19:53:34.346Z", "lft": 2, "tree_id": 42, "position": 0, "placeholder": 18, "plugin_type": "LinkPlugin"}}]	94
1907	109	95	95	10	json	[{"pk": 95, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-07T23:55:40.579Z", "parent": 93, "language": "en", "level": 1, "creation_date": "2014-09-07T19:53:41.617Z", "lft": 4, "tree_id": 42, "position": 1, "placeholder": 18, "plugin_type": "LinkPlugin"}}]	95
1908	109	3	3	16	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "About Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 3, "published": true, "path": "about-us", "publisher_state": 1, "creation_date": "2014-09-07T23:09:31.805Z", "slug": "about-us", "publisher_public": 4}}]	About Us (about-us, en)
1909	109	97	97	10	json	[{"pk": 97, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-08T00:06:28.027Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-08T00:04:27.520Z", "lft": 1, "tree_id": 43, "position": 12, "placeholder": 18, "plugin_type": "TextPlugin"}}]	97
1910	109	60	60	25	json	[{"pk": 60, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/guardiant-gauges_1.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	guardiant-gauges_1.png
1911	109	93	93	10	json	[{"pk": 93, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-08T00:02:52.852Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T19:38:55.995Z", "lft": 1, "tree_id": 42, "position": 4, "placeholder": 18, "plugin_type": "TextPlugin"}}]	93
1912	110	3	3	11	json	[{"pk": 3, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": false, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "template_1.html", "tree_id": 2, "placeholders": [18, 19], "changed_date": "2014-09-08T00:06:28.142Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-07T23:09:52.067Z", "creation_date": "2014-09-07T23:09:31.722Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	About Us
1913	110	86	86	31	json	[{"pk": 86, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"about-us-gauges bb3\\">\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\u200b<img title=\\"Picture - services-guard.png\\" id=\\"plugin_obj_87\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></li>\\n\\t</ul>\\n\\t</li>\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Services</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. Our rapid response team is here 24/7 365 and we are global in scope. Additionally, Guardiant studies the trends in preventive maintenance and uses that information to develop methodology for true predictive maintenance. We can help you get from the costly reactive maintenvance cycle into a cost effective preventative maintenance plan. Imagine operations where the only downtime is the one you planned for.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	​ Services Guardiant...
1914	110	87	87	10	json	[{"pk": 87, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:54:24.623Z", "parent": 86, "language": "en", "level": 1, "creation_date": "2014-09-07T23:27:37.395Z", "lft": 2, "tree_id": 38, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	87
1915	110	94	94	28	json	[{"pk": 94, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact us", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Contact us
1916	110	18	18	9	json	[{"pk": 18, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
1917	110	19	19	9	json	[{"pk": 19, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
1918	110	68	68	31	json	[{"pk": 68, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - guardiant-truck_1.png\\" id=\\"plugin_obj_70\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
1919	110	70	70	25	json	[{"pk": 70, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/guardiant-truck_1.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	guardiant-truck_1.png
1920	110	93	93	31	json	[{"pk": 93, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"help-container\\">\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact us\\" id=\\"plugin_obj_94\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link - Contact us\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_95\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link - Find a distributor\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
1921	110	52	52	10	json	[{"pk": 52, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-07T23:55:40.597Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:12:33.888Z", "lft": 1, "tree_id": 25, "position": 0, "placeholder": 18, "plugin_type": "TextPlugin"}}]	52
1922	110	53	53	25	json	[{"pk": 53, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/about-us_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	about-us_1.png
1926	110	60	60	10	json	[{"pk": 60, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:51:40.662Z", "parent": 58, "language": "en", "level": 1, "creation_date": "2014-09-07T23:27:37.395Z", "lft": 2, "tree_id": 28, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	60
1927	110	53	53	10	json	[{"pk": 53, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:12:54.627Z", "parent": 52, "language": "en", "level": 1, "creation_date": "2014-09-07T23:12:42.336Z", "lft": 2, "tree_id": 25, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	53
1928	110	68	68	10	json	[{"pk": 68, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-07T23:55:40.614Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:39:16.553Z", "lft": 1, "tree_id": 33, "position": 2, "placeholder": 18, "plugin_type": "TextPlugin"}}]	68
1929	110	69	69	10	json	[{"pk": 69, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:50:38.241Z", "parent": 68, "language": "en", "level": 1, "creation_date": "2014-09-07T23:39:22.447Z", "lft": 2, "tree_id": 33, "position": 0, "placeholder": 18, "plugin_type": "FilePlugin"}}]	69
1930	110	70	70	10	json	[{"pk": 70, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-07T23:50:38.248Z", "parent": 68, "language": "en", "level": 1, "creation_date": "2014-09-07T23:39:26.116Z", "lft": 4, "tree_id": 33, "position": 1, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	70
1931	110	97	97	31	json	[{"pk": 97, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"definition-with-quote\\">\\n\\t<li>\\u00a0\\n\\t<ul class=\\"definition\\">\\n\\t\\t<li>\\n\\t\\t<h2>Training</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>When your work force is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill the need. Guardiant trainers have extensive backgrounds in compressor maintenance and are excellent teachers. High end training aids such as animated videos, comprehensive manuals, and hands on training ensure you get the most effective use of your training dollars.\\u00a0</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li>\\u00a0\\n\\t<ul class=\\"quote\\">\\n\\t\\t<li>\\u201c We believe that excellent training will propel this industry forward. We want to be your asset to help in the field, classroom or even providing assistance with our 24/7/365 \\u0003service line.\\u201d</li>\\n\\t\\t<li class=\\"whom\\">Scott Roys</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Training When your...
1932	110	86	86	10	json	[{"pk": 86, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-07T23:55:40.632Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:25:58.378Z", "lft": 1, "tree_id": 38, "position": 3, "placeholder": 18, "plugin_type": "TextPlugin"}}]	86
1933	110	87	87	25	json	[{"pk": 87, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/services-guard.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	services-guard.png
1934	110	58	58	31	json	[{"pk": 58, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"about-us-gauges bb3\\">\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Replacement Parts</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Parts manufactured for Guardiant are made with the best materials available and meet the tightest tolerances in the industry. Our highly trained staff is ready to assist you in identifying the exact part you need and getting it into your hands as quickly as possible. We know compressors and we know how to get you rolling again.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li><img title=\\"Picture - guardiant-gauges_1.png\\" id=\\"plugin_obj_60\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Replacement Parts Guardiant...
1935	110	94	94	10	json	[{"pk": 94, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:55:40.574Z", "parent": 93, "language": "en", "level": 1, "creation_date": "2014-09-07T19:53:34.346Z", "lft": 2, "tree_id": 42, "position": 0, "placeholder": 18, "plugin_type": "LinkPlugin"}}]	94
1936	110	95	95	10	json	[{"pk": 95, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-07T23:55:40.579Z", "parent": 93, "language": "en", "level": 1, "creation_date": "2014-09-07T19:53:41.617Z", "lft": 4, "tree_id": 42, "position": 1, "placeholder": 18, "plugin_type": "LinkPlugin"}}]	95
1937	110	3	3	16	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "About Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 3, "published": true, "path": "about-us", "publisher_state": 1, "creation_date": "2014-09-07T23:09:31.805Z", "slug": "about-us", "publisher_public": 4}}]	About Us (about-us, en)
1938	110	97	97	10	json	[{"pk": 97, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-08T00:16:15.520Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-08T00:04:27.520Z", "lft": 1, "tree_id": 43, "position": 12, "placeholder": 18, "plugin_type": "TextPlugin"}}]	97
1939	110	60	60	25	json	[{"pk": 60, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/guardiant-gauges_1.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	guardiant-gauges_1.png
1940	110	93	93	10	json	[{"pk": 93, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-08T00:02:52.852Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T19:38:55.995Z", "lft": 1, "tree_id": 42, "position": 4, "placeholder": 18, "plugin_type": "TextPlugin"}}]	93
1941	111	3	3	11	json	[{"pk": 3, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": false, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "template_1.html", "tree_id": 2, "placeholders": [18, 19], "changed_date": "2014-09-08T00:16:15.656Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-07T23:09:52.067Z", "creation_date": "2014-09-07T23:09:31.722Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	About Us
1961	111	86	86	10	json	[{"pk": 86, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-07T23:55:40.632Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:25:58.378Z", "lft": 1, "tree_id": 38, "position": 3, "placeholder": 18, "plugin_type": "TextPlugin"}}]	86
1962	111	87	87	25	json	[{"pk": 87, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/services-guard.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	services-guard.png
1942	111	86	86	31	json	[{"pk": 86, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"about-us-gauges bb3\\">\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\u200b<img title=\\"Picture - services-guard.png\\" id=\\"plugin_obj_87\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></li>\\n\\t</ul>\\n\\t</li>\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Services</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. Our rapid response team is here 24/7 365 and we are global in scope. Additionally, Guardiant studies the trends in preventive maintenance and uses that information to develop methodology for true predictive maintenance. We can help you get from the costly reactive maintenvance cycle into a cost effective preventative maintenance plan. Imagine operations where the only downtime is the one you planned for.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	​ Services Guardiant...
1943	111	87	87	10	json	[{"pk": 87, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:54:24.623Z", "parent": 86, "language": "en", "level": 1, "creation_date": "2014-09-07T23:27:37.395Z", "lft": 2, "tree_id": 38, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	87
1944	111	94	94	28	json	[{"pk": 94, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact us", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Contact us
1945	111	18	18	9	json	[{"pk": 18, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
1946	111	19	19	9	json	[{"pk": 19, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
1947	111	68	68	31	json	[{"pk": 68, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - guardiant-truck_1.png\\" id=\\"plugin_obj_70\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
1948	111	70	70	25	json	[{"pk": 70, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/guardiant-truck_1.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	guardiant-truck_1.png
1949	111	93	93	31	json	[{"pk": 93, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"help-container\\">\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact us\\" id=\\"plugin_obj_94\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link - Contact us\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_95\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link - Find a distributor\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
1950	111	52	52	10	json	[{"pk": 52, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-07T23:55:40.597Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:12:33.888Z", "lft": 1, "tree_id": 25, "position": 0, "placeholder": 18, "plugin_type": "TextPlugin"}}]	52
1951	111	53	53	25	json	[{"pk": 53, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/about-us_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	about-us_1.png
1952	111	52	52	31	json	[{"pk": 52, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - about-us_1.png\\" id=\\"plugin_obj_53\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>"}}]	
1953	111	58	58	10	json	[{"pk": 58, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-07T23:55:40.605Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:25:58.378Z", "lft": 1, "tree_id": 28, "position": 1, "placeholder": 18, "plugin_type": "TextPlugin"}}]	58
1954	111	95	95	28	json	[{"pk": 95, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
1955	111	60	60	10	json	[{"pk": 60, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:51:40.662Z", "parent": 58, "language": "en", "level": 1, "creation_date": "2014-09-07T23:27:37.395Z", "lft": 2, "tree_id": 28, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	60
1956	111	53	53	10	json	[{"pk": 53, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:12:54.627Z", "parent": 52, "language": "en", "level": 1, "creation_date": "2014-09-07T23:12:42.336Z", "lft": 2, "tree_id": 25, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	53
1957	111	68	68	10	json	[{"pk": 68, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-07T23:55:40.614Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:39:16.553Z", "lft": 1, "tree_id": 33, "position": 2, "placeholder": 18, "plugin_type": "TextPlugin"}}]	68
1958	111	69	69	10	json	[{"pk": 69, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:50:38.241Z", "parent": 68, "language": "en", "level": 1, "creation_date": "2014-09-07T23:39:22.447Z", "lft": 2, "tree_id": 33, "position": 0, "placeholder": 18, "plugin_type": "FilePlugin"}}]	69
1959	111	70	70	10	json	[{"pk": 70, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-07T23:50:38.248Z", "parent": 68, "language": "en", "level": 1, "creation_date": "2014-09-07T23:39:26.116Z", "lft": 4, "tree_id": 33, "position": 1, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	70
1960	111	97	97	31	json	[{"pk": 97, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"definition-with-quote\\">\\n\\t<li class=\\"definition\\">\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Training</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>When your work force is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill the need. Guardiant trainers have extensive backgrounds in compressor maintenance and are excellent teachers. High end training aids such as animated videos, comprehensive manuals, and hands on training ensure you get the most effective use of your training dollars.\\u00a0</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"quote\\">\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\u201c We believe that excellent training will propel this industry forward. We want to be your asset to help in the field, classroom or even providing assistance with our 24/7/365 \\u0003service line.\\u201d</li>\\n\\t\\t<li class=\\"whom\\">Scott Roys</li>\\n\\t</ul>\\n\\t</li>\\n</ul>"}}]	Training When your...
1963	111	58	58	31	json	[{"pk": 58, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"about-us-gauges bb3\\">\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Replacement Parts</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Parts manufactured for Guardiant are made with the best materials available and meet the tightest tolerances in the industry. Our highly trained staff is ready to assist you in identifying the exact part you need and getting it into your hands as quickly as possible. We know compressors and we know how to get you rolling again.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li><img title=\\"Picture - guardiant-gauges_1.png\\" id=\\"plugin_obj_60\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Replacement Parts Guardiant...
1964	111	94	94	10	json	[{"pk": 94, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-07T23:55:40.574Z", "parent": 93, "language": "en", "level": 1, "creation_date": "2014-09-07T19:53:34.346Z", "lft": 2, "tree_id": 42, "position": 0, "placeholder": 18, "plugin_type": "LinkPlugin"}}]	94
1965	111	95	95	10	json	[{"pk": 95, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-07T23:55:40.579Z", "parent": 93, "language": "en", "level": 1, "creation_date": "2014-09-07T19:53:41.617Z", "lft": 4, "tree_id": 42, "position": 1, "placeholder": 18, "plugin_type": "LinkPlugin"}}]	95
1966	111	3	3	16	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "About Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 3, "published": true, "path": "about-us", "publisher_state": 1, "creation_date": "2014-09-07T23:09:31.805Z", "slug": "about-us", "publisher_public": 4}}]	About Us (about-us, en)
1967	111	97	97	10	json	[{"pk": 97, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-08T01:21:02.093Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-08T00:04:27.520Z", "lft": 1, "tree_id": 43, "position": 12, "placeholder": 18, "plugin_type": "TextPlugin"}}]	97
1968	111	60	60	25	json	[{"pk": 60, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/guardiant-gauges_1.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	guardiant-gauges_1.png
1969	111	93	93	10	json	[{"pk": 93, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-08T00:02:52.852Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T19:38:55.995Z", "lft": 1, "tree_id": 42, "position": 4, "placeholder": 18, "plugin_type": "TextPlugin"}}]	93
2105	123	100	100	31	json	[{"pk": 100, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - products-header.png\\" id=\\"plugin_obj_101\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2106	123	5	5	11	json	[{"pk": 5, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "products.html", "tree_id": 5, "placeholders": [24, 25, 26, 27], "changed_date": "2014-09-08T01:35:10.840Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-08T01:35:10.386Z", "creation_date": "2014-09-08T01:25:48.188Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Products
2107	123	104	104	31	json	[{"pk": 104, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"about-us-gauges bb3\\">\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>OVERVIEW</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant is committed to supplying high quality parts as quickly as possible. Our warehouse is kept stocked and in almost all cases, we can fulfill your requests immediately. Because parts can be highly configurable or cosmetically similar but functionally different, we always suggest that you talk with our staff before ordering. Our staff members are highly trained and have years of experience in the lubrication field.\\u00a0</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li>\\u00a0\\n\\t<ul>\\n\\t\\t<li><img title=\\"Picture - guardiant-screw.png\\" id=\\"plugin_obj_105\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	OVERVIEW Guardiant is...
2108	123	105	105	25	json	[{"pk": 105, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/5/guardiant-screw.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	guardiant-screw.png
2109	123	5	5	16	json	[{"pk": 5, "model": "cms.title", "fields": {"menu_title": "Products", "meta_description": "", "page_title": "", "language": "en", "title": "Products", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 5, "published": true, "path": "products", "publisher_state": 1, "creation_date": "2014-09-08T01:25:48.269Z", "slug": "products", "publisher_public": 6}}]	Products (products, en)
2110	123	104	104	10	json	[{"pk": 104, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-08T01:34:55.963Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:25:58.378Z", "lft": 1, "tree_id": 47, "position": 1, "placeholder": 26, "plugin_type": "TextPlugin"}}]	104
2111	123	25	25	9	json	[{"pk": 25, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2112	123	105	105	10	json	[{"pk": 105, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-08T01:34:25.473Z", "parent": 104, "language": "en", "level": 1, "creation_date": "2014-09-07T23:27:37.395Z", "lft": 2, "tree_id": 47, "position": 0, "placeholder": 26, "plugin_type": "PicturePlugin"}}]	105
2113	123	24	24	9	json	[{"pk": 24, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2114	123	100	100	10	json	[{"pk": 100, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-08T01:30:24.485Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-07T23:12:33.888Z", "lft": 1, "tree_id": 45, "position": 0, "placeholder": 25, "plugin_type": "TextPlugin"}}]	100
2115	123	26	26	9	json	[{"pk": 26, "model": "cms.placeholder", "fields": {"slot": "general", "default_width": null}}]	general
2116	123	27	27	9	json	[{"pk": 27, "model": "cms.placeholder", "fields": {"slot": "products", "default_width": null}}]	products
2117	123	101	101	25	json	[{"pk": 101, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/5/products-banner.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	products-banner.png
2773	175	30	30	10	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:43:17.344Z", "parent": 29, "language": "en", "level": 1, "creation_date": "2014-09-14T20:34:22.410Z", "lft": 2, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	30
2774	175	37	37	10	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T20:46:23.347Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 21, "position": 1, "placeholder": 34, "plugin_type": "TextPlugin"}}]	37
2900	184	39	39	25	json	[{"pk": 39, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/service-trucks.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	service-trucks.png
2901	184	50	50	10	json	[{"pk": 50, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T21:00:11.509Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 26, "position": 3, "placeholder": 34, "plugin_type": "TextPlugin"}}]	50
2775	176	34	34	9	json	[{"pk": 34, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2776	176	35	35	9	json	[{"pk": 35, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2777	176	37	37	31	json	[{"pk": 37, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Lube Design</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>A properly designed lubrication system is essential to the long term profitability of a compressor operation. Proper designs keep mechanical wear to a minimum as well as ensure that only the proper amount of lube is consumed. factors such as rod and piston diameters, operating pressures, field conditions, and gas composition all need to be balanced in a proper design. Part of the design process is scientific, part of the design process is rooted in years of experience. Guardient personnel are the best in the industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>On Site Analysis</h2>\\n\\n\\t\\t<p>In situations where a problem is recurring and can\\u2019t seem to be isolated, an on site analysis is the first step in long term resolution. Give us a call and we\\u2019ll be happy to discuss the problem. Sometimes the problem isn\\u2019t as complicated as it seems and can be identified just by talking through it with one of our knowledgeable people.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Lube Design A...
2778	176	38	38	31	json	[{"pk": 38, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - service-trucks.png\\" id=\\"plugin_obj_39\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2779	176	39	39	25	json	[{"pk": 39, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/service-trucks.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	service-trucks.png
2780	176	8	8	11	json	[{"pk": 8, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 8, "placeholders": [34, 35], "changed_date": "2014-09-14T20:47:45.365Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T20:35:41.020Z", "creation_date": "2014-09-14T20:34:02.734Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Services
3593	223	15	15	10	json	[{"pk": 15, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:06:11.327Z", "parent": 14, "language": "en", "level": 1, "creation_date": "2014-09-14T20:05:20.070Z", "lft": 2, "tree_id": 7, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	15
3594	223	149	149	31	json	[{"pk": 149, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2>OUR MISSION</h2>\\n\\n<p>Our Mission is to be the leading lubrication systems company in the industry by providing world class training to our technicians, customers and our global distributor network. \\u00a0Our mission includes providing only the highest quality products with the most technologically advanced lubrication equipment available in the industry today. We continuously seek out the industries best component manufacturers and by constant research, development and testing of new products and lubrication methods.</p>\\n\\n<h2>WHO WE ARE</h2>\\n\\n<p>A compressor lubrication systems company founded on one simple principle, \\u201cAlways Do the Next Right Thing\\u201d. \\u00a0A single minded quest to take the mystery out of the force feed divider block lubrication system and the components used to make it work. \\u00a0We accomplish this by not only utilizing the best current products and technology, but also by continuously pushing ourselves to build and improve our products with the latest, superior technology. \\u00a0A major emphasis is placed on training our staff; from office and shop personnel to highly qualified field service and installation technicians as well as our worldwide distribution networks on the latest, greatest possibilities to help serve our customers while solving their lubrication needs.<br>\\n\\u00a0 \\u00a0\\u00a0<br>\\nGuardiant continuously studies trends in preventive maintenance and uses that information to develop methodology for true predictive maintenance. \\u00a0We have the data, background and many years of experience to serve all of our customers compressor lubrication needs.</p>\\n\\n<p>OEM and direct replacement parts including new innovative manufactured products. \\u00a0We stock all components for complete systems as well as design engineering and reverse engineering of existing systems. \\u00a0With our certified-world class training, both on site and remote troubleshooting capability, we are a full 24/7-365 company who will never lose sight that our customers are the only reason we are here.</p>\\n\\n<p>Whether it is increasing runtime, reliability, and wear-product life or cutting operating cost via oil consumption for one compressor or your entire fleet, Guardiant is your lubrication systems company of choice, today and for many years of trouble free operation.</p>\\n\\n<h2>OUR VALUES</h2>\\n\\n<p><strong>L</strong>oyalty - Founded in family principles we are loyal to our employees, distributors and customers<br>\\n<strong>U</strong>ncompromising - We are uncompromising in the quality of our products and service<br>\\n<strong>B</strong>est - We strive to be the best lubrication company in the industry<br>\\n<strong>E</strong>thical - We treat all of our employees, distributors and customers with the highest ethical standards</p>\\n\\n<p>\\u00a0</p>\\n"}}]	OUR MISSION Our...
3854	252	164	164	10	json	[{"pk": 164, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-21T02:11:20.618Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-21T02:10:57.826Z", "lft": 1, "tree_id": 51, "position": 2, "placeholder": 32, "plugin_type": "GuardiantContactPlugin"}}]	164
3855	252	85	85	10	json	[{"pk": 85, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T22:38:31.215Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T22:38:10.897Z", "lft": 1, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "TextPlugin"}}]	85
3595	224	3	3	16	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "About Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 3, "published": true, "path": "about-us", "publisher_state": 1, "creation_date": "2014-09-07T23:09:31.805Z", "slug": "about-us", "publisher_public": 4}}]	About Us (about-us, en)
3596	224	3	3	11	json	[{"pk": 3, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": false, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "template_1.html", "tree_id": 2, "placeholders": [18, 19], "changed_date": "2014-09-20T21:30:19.138Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-07T23:09:52.067Z", "creation_date": "2014-09-07T23:09:31.722Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	About Us
3597	224	14	14	31	json	[{"pk": 14, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - about-us_2.png\\" id=\\"plugin_obj_15\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
3598	224	14	14	10	json	[{"pk": 14, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:06:13.191Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:04:34.300Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 18, "plugin_type": "TextPlugin"}}]	14
3599	224	15	15	25	json	[{"pk": 15, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/about-us_2.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	about-us_2.png
3600	224	18	18	9	json	[{"pk": 18, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3601	224	19	19	9	json	[{"pk": 19, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3602	224	149	149	10	json	[{"pk": 149, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-20T21:31:01.696Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-20T21:28:43.598Z", "lft": 1, "tree_id": 48, "position": 2, "placeholder": 18, "plugin_type": "TextPlugin"}}]	149
3603	224	15	15	10	json	[{"pk": 15, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:06:11.327Z", "parent": 14, "language": "en", "level": 1, "creation_date": "2014-09-14T20:05:20.070Z", "lft": 2, "tree_id": 7, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	15
3604	224	149	149	31	json	[{"pk": 149, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<div class=\\"single-blue\\">\\n<h2>OUR MISSION</h2>\\n\\n<p>Our Mission is to be the leading lubrication systems company in the industry by providing world class training to our technicians, customers and our global distributor network. \\u00a0Our mission includes providing only the highest quality products with the most technologically advanced lubrication equipment available in the industry today. We continuously seek out the industries best component manufacturers and by constant research, development and testing of new products and lubrication methods.</p>\\n\\n<h2>WHO WE ARE</h2>\\n\\n<p>A compressor lubrication systems company founded on one simple principle, \\u201cAlways Do the Next Right Thing\\u201d. \\u00a0A single minded quest to take the mystery out of the force feed divider block lubrication system and the components used to make it work. \\u00a0We accomplish this by not only utilizing the best current products and technology, but also by continuously pushing ourselves to build and improve our products with the latest, superior technology. \\u00a0A major emphasis is placed on training our staff; from office and shop personnel to highly qualified field service and installation technicians as well as our worldwide distribution networks on the latest, greatest possibilities to help serve our customers while solving their lubrication needs.<br>\\n\\u00a0 \\u00a0\\u00a0<br>\\nGuardiant continuously studies trends in preventive maintenance and uses that information to develop methodology for true predictive maintenance. \\u00a0We have the data, background and many years of experience to serve all of our customers compressor lubrication needs.</p>\\n\\n<p>OEM and direct replacement parts including new innovative manufactured products. \\u00a0We stock all components for complete systems as well as design engineering and reverse engineering of existing systems. \\u00a0With our certified-world class training, both on site and remote troubleshooting capability, we are a full 24/7-365 company who will never lose sight that our customers are the only reason we are here.</p>\\n\\n<p>Whether it is increasing runtime, reliability, and wear-product life or cutting operating cost via oil consumption for one compressor or your entire fleet, Guardiant is your lubrication systems company of choice, today and for many years of trouble free operation.</p>\\n\\n<h2>OUR VALUES</h2>\\n\\n<p><strong>L</strong>oyalty - Founded in family principles we are loyal to our employees, distributors and customers<br>\\n<strong>U</strong>ncompromising - We are uncompromising in the quality of our products and service<br>\\n<strong>B</strong>est - We strive to be the best lubrication company in the industry<br>\\n<strong>E</strong>thical - We treat all of our employees, distributors and customers with the highest ethical standards</p>\\n\\n</div>\\n"}}]	OUR MISSION Our...
3605	225	3	3	16	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "About Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 3, "published": true, "path": "about-us", "publisher_state": 0, "creation_date": "2014-09-07T23:09:31.805Z", "slug": "about-us", "publisher_public": 4}}]	About Us (about-us, en)
3606	225	3	3	11	json	[{"pk": 3, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": false, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "template_1.html", "tree_id": 2, "placeholders": [18, 19], "changed_date": "2014-09-20T21:33:47.885Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-07T23:09:52.067Z", "creation_date": "2014-09-07T23:09:31.722Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	About Us
3607	225	14	14	31	json	[{"pk": 14, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p class=\\"bb3\\"><img title=\\"Picture - about-us_2.png\\" id=\\"plugin_obj_15\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
3608	225	14	14	10	json	[{"pk": 14, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T20:06:13.191Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:04:34.300Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 18, "plugin_type": "TextPlugin"}}]	14
3609	225	15	15	25	json	[{"pk": 15, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/3/about-us_2.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	about-us_2.png
3610	225	18	18	9	json	[{"pk": 18, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3611	225	19	19	9	json	[{"pk": 19, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3612	225	149	149	10	json	[{"pk": 149, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-20T21:31:01.696Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-20T21:28:43.598Z", "lft": 1, "tree_id": 48, "position": 2, "placeholder": 18, "plugin_type": "TextPlugin"}}]	149
3856	253	32	32	9	json	[{"pk": 32, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3613	225	15	15	10	json	[{"pk": 15, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:06:11.327Z", "parent": 14, "language": "en", "level": 1, "creation_date": "2014-09-14T20:05:20.070Z", "lft": 2, "tree_id": 7, "position": 0, "placeholder": 18, "plugin_type": "PicturePlugin"}}]	15
3857	253	33	33	9	json	[{"pk": 33, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3858	253	165	165	10	json	[{"pk": 165, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-21T02:19:42.912Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-21T02:19:42.904Z", "lft": 1, "tree_id": 51, "position": 2, "placeholder": 32, "plugin_type": "ContactPlugin"}}]	165
2605	155	12	12	10	json	[{"pk": 12, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T19:59:14.136Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:58:57.858Z", "lft": 2, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	12
2606	155	13	13	10	json	[{"pk": 13, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-14T19:59:29.618Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:59:18.874Z", "lft": 4, "tree_id": 6, "position": 1, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	13
2607	155	11	11	31	json	[{"pk": 11, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact Us\\" id=\\"plugin_obj_12\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_13\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
2608	155	7	7	34	json	[{"pk": 7, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/quote_gallery.html", "title": "Quote Gallery"}}]	1 image(s) in gallery
2609	155	8	8	10	json	[{"pk": 8, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:48:42.335Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:48:23.267Z", "lft": 1, "tree_id": 5, "position": 0, "placeholder": 9, "plugin_type": "TextPlugin"}}]	8
2781	176	39	39	10	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:47:45.231Z", "parent": 38, "language": "en", "level": 1, "creation_date": "2014-09-14T20:47:36.482Z", "lft": 2, "tree_id": 22, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	39
2782	176	29	29	31	json	[{"pk": 29, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - services-banner_1.png\\" id=\\"plugin_obj_30\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2783	176	8	8	16	json	[{"pk": 8, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Services", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 8, "published": true, "path": "services", "publisher_state": 1, "creation_date": "2014-09-14T20:34:02.850Z", "slug": "services", "publisher_public": 9}}]	Services (services, en)
3859	253	7	7	11	json	[{"pk": 7, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 7, "placeholders": [32, 33], "changed_date": "2014-09-21T02:11:20.700Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T22:38:35.974Z", "creation_date": "2014-09-14T18:50:32.945Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Contact Us
2904	184	50	50	31	json	[{"pk": 50, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"two-up-blue\\">\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Installation</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>A properly installed lubrication system will eliminate many headaches you will otherwise encounter. In fact, poorly or improperly installed systems are one of the leading causes of system problems. The installation teams at Guardiant are sticklers for getting every detail right.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Stand Alone Lube System</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant builds stand alone lubrication systems that can be set up anywhere, that run independent of any compressor drives, and are designed to fit your specific lubrication needs. The applications for these versatile units are wide open. Anywhere an independant and precision lube source is required.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Installation A properly...
2905	184	30	30	10	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:43:17.344Z", "parent": 29, "language": "en", "level": 1, "creation_date": "2014-09-14T20:34:22.410Z", "lft": 2, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	30
2906	184	61	61	31	json	[{"pk": 61, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact Us\\" id=\\"plugin_obj_62\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link - Contact Us\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_63\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link - Find a distributor\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
2907	184	62	62	28	json	[{"pk": 62, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact Us", "url": "", "page_link": null, "phone": "", "anchor": "", "target": ""}}]	Contact Us
2908	184	63	63	10	json	[{"pk": 63, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-14T21:04:12.559Z", "parent": 61, "language": "en", "level": 1, "creation_date": "2014-09-14T19:59:18.874Z", "lft": 4, "tree_id": 33, "position": 1, "placeholder": 34, "plugin_type": "LinkPlugin"}}]	63
2909	184	37	37	10	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T21:00:11.519Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 21, "position": 1, "placeholder": 34, "plugin_type": "TextPlugin"}}]	37
2910	184	38	38	10	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T21:00:11.527Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:47:30.733Z", "lft": 1, "tree_id": 22, "position": 2, "placeholder": 34, "plugin_type": "TextPlugin"}}]	38
2911	184	39	39	10	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:47:45.231Z", "parent": 38, "language": "en", "level": 1, "creation_date": "2014-09-14T20:47:36.482Z", "lft": 2, "tree_id": 22, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	39
2912	184	61	61	10	json	[{"pk": 61, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-14T21:04:12.619Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:51:07.209Z", "lft": 1, "tree_id": 33, "position": 0, "placeholder": 34, "plugin_type": "TextPlugin"}}]	61
2913	184	62	62	10	json	[{"pk": 62, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T21:04:12.523Z", "parent": 61, "language": "en", "level": 1, "creation_date": "2014-09-14T19:58:57.858Z", "lft": 2, "tree_id": 33, "position": 0, "placeholder": 34, "plugin_type": "LinkPlugin"}}]	62
2914	184	63	63	28	json	[{"pk": 63, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
3614	225	149	149	31	json	[{"pk": 149, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<div class=\\"single-blue\\">\\n<h2>OUR MISSION</h2>\\n\\n<p>Our Mission is to be the leading lubrication systems company in the industry by providing world class training to our technicians, customers and our global distributor network. \\u00a0Our mission includes providing only the highest quality products with the most technologically advanced lubrication equipment available in the industry today. We continuously seek out the industries best component manufacturers and by constant research, development and testing of new products and lubrication methods.</p>\\n\\n<h2>WHO WE ARE</h2>\\n\\n<p>A compressor lubrication systems company founded on one simple principle, \\u201cAlways Do the Next Right Thing\\u201d. \\u00a0A single minded quest to take the mystery out of the force feed divider block lubrication system and the components used to make it work. \\u00a0We accomplish this by not only utilizing the best current products and technology, but also by continuously pushing ourselves to build and improve our products with the latest, superior technology. \\u00a0A major emphasis is placed on training our staff; from office and shop personnel to highly qualified field service and installation technicians as well as our worldwide distribution networks on the latest, greatest possibilities to help serve our customers while solving their lubrication needs.<br>\\n\\u00a0 \\u00a0\\u00a0<br>\\nGuardiant continuously studies trends in preventive maintenance and uses that information to develop methodology for true predictive maintenance. \\u00a0We have the data, background and many years of experience to serve all of our customers compressor lubrication needs.</p>\\n\\n<p>OEM and direct replacement parts including new innovative manufactured products. \\u00a0We stock all components for complete systems as well as design engineering and reverse engineering of existing systems. \\u00a0With our certified-world class training, both on site and remote troubleshooting capability, we are a full 24/7-365 company who will never lose sight that our customers are the only reason we are here.</p>\\n\\n<p>Whether it is increasing runtime, reliability, and wear-product life or cutting operating cost via oil consumption for one compressor or your entire fleet, Guardiant is your lubrication systems company of choice, today and for many years of trouble free operation.</p>\\n\\n<h2>OUR VALUES</h2>\\n\\n<p><strong>L</strong>oyalty - Founded in family principles we are loyal to our employees, distributors and customers<br>\\n<strong>U</strong>ncompromising - We are uncompromising in the quality of our products and service<br>\\n<strong>B</strong>est - We strive to be the best lubrication company in the industry<br>\\n<strong>E</strong>thical - We treat all of our employees, distributors and customers with the highest ethical standards</p>\\n\\n</div>\\n"}}]	OUR MISSION Our...
3860	253	7	7	16	json	[{"pk": 7, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Contact Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 7, "published": true, "path": "contact-us", "publisher_state": 1, "creation_date": "2014-09-14T18:50:33.093Z", "slug": "contact-us", "publisher_public": 11}}]	Contact Us (contact-us, en)
3861	253	85	85	31	json	[{"pk": 85, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - contact-us-banner.jpg\\" id=\\"plugin_obj_86\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
3862	253	86	86	10	json	[{"pk": 86, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T22:38:31.174Z", "parent": 85, "language": "en", "level": 1, "creation_date": "2014-09-14T22:38:15.230Z", "lft": 2, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "PicturePlugin"}}]	86
2920	185	37	37	31	json	[{"pk": 37, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"two-up-light\\">\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Lube Design</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>A properly designed lubrication system is essential to the long term profitability of a compressor operation. Proper designs keep mechanical wear to a minimum as well as ensure that only the proper amount of lube is consumed. factors such as rod and piston diameters, operating pressures, field conditions, and gas composition all need to be balanced in a proper design. Part of the design process is scientific, part of the design process is rooted in years of experience. Guardient personnel are the best in the industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>On Site Analysis</h2>\\n\\n\\t\\t<p>In situations where a problem is recurring and can\\u2019t seem to be isolated, an on site analysis is the first step in long term resolution. Give us a call and we\\u2019ll be happy to discuss the problem. Sometimes the problem isn\\u2019t as complicated as it seems and can be identified just by talking through it with one of our knowledgeable people.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Lube Design A...
2921	185	38	38	31	json	[{"pk": 38, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - service-trucks.png\\" id=\\"plugin_obj_39\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2922	185	39	39	25	json	[{"pk": 39, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/service-trucks.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	service-trucks.png
2923	185	50	50	10	json	[{"pk": 50, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T21:04:19.642Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 26, "position": 3, "placeholder": 34, "plugin_type": "TextPlugin"}}]	50
2924	185	29	29	10	json	[{"pk": 29, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T21:04:19.593Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:34:15.847Z", "lft": 1, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "TextPlugin"}}]	29
2925	185	8	8	16	json	[{"pk": 8, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Services", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 8, "published": true, "path": "services", "publisher_state": 1, "creation_date": "2014-09-14T20:34:02.850Z", "slug": "services", "publisher_public": 9}}]	Services (services, en)
2926	185	50	50	31	json	[{"pk": 50, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"two-up-blue\\">\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Installation</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>A properly installed lubrication system will eliminate many headaches you will otherwise encounter. In fact, poorly or improperly installed systems are one of the leading causes of system problems. The installation teams at Guardiant are sticklers for getting every detail right.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Stand Alone Lube System</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant builds stand alone lubrication systems that can be set up anywhere, that run independent of any compressor drives, and are designed to fit your specific lubrication needs. The applications for these versatile units are wide open. Anywhere an independant and precision lube source is required.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Installation A properly...
2927	185	30	30	10	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:43:17.344Z", "parent": 29, "language": "en", "level": 1, "creation_date": "2014-09-14T20:34:22.410Z", "lft": 2, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	30
2928	185	61	61	31	json	[{"pk": 61, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact Us\\" id=\\"plugin_obj_62\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link - Contact Us\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_63\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link - Find a distributor\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
2929	185	62	62	28	json	[{"pk": 62, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact Us", "url": "", "page_link": null, "phone": "", "anchor": "", "target": ""}}]	Contact Us
2930	185	63	63	10	json	[{"pk": 63, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-14T21:04:19.578Z", "parent": 61, "language": "en", "level": 1, "creation_date": "2014-09-14T19:59:18.874Z", "lft": 4, "tree_id": 33, "position": 1, "placeholder": 34, "plugin_type": "LinkPlugin"}}]	63
2931	185	37	37	10	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T21:04:19.615Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 21, "position": 1, "placeholder": 34, "plugin_type": "TextPlugin"}}]	37
2932	185	38	38	10	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T21:04:19.629Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:47:30.733Z", "lft": 1, "tree_id": 22, "position": 2, "placeholder": 34, "plugin_type": "TextPlugin"}}]	38
2933	185	39	39	10	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:47:45.231Z", "parent": 38, "language": "en", "level": 1, "creation_date": "2014-09-14T20:47:36.482Z", "lft": 2, "tree_id": 22, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	39
2934	185	61	61	10	json	[{"pk": 61, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-14T21:04:19.606Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:51:07.209Z", "lft": 1, "tree_id": 33, "position": 4, "placeholder": 34, "plugin_type": "TextPlugin"}}]	61
2935	185	62	62	10	json	[{"pk": 62, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T21:04:19.564Z", "parent": 61, "language": "en", "level": 1, "creation_date": "2014-09-14T19:58:57.858Z", "lft": 2, "tree_id": 33, "position": 0, "placeholder": 34, "plugin_type": "LinkPlugin"}}]	62
2936	185	63	63	28	json	[{"pk": 63, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
2937	186	8	8	11	json	[{"pk": 8, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 8, "placeholders": [34, 35], "changed_date": "2014-09-14T21:04:22.875Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T20:35:41.020Z", "creation_date": "2014-09-14T20:34:02.734Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Services
2938	186	29	29	31	json	[{"pk": 29, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - services-banner_1.png\\" id=\\"plugin_obj_30\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2939	186	30	30	25	json	[{"pk": 30, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/services-banner_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	services-banner_1.png
2940	186	34	34	9	json	[{"pk": 34, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2941	186	35	35	9	json	[{"pk": 35, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2942	186	37	37	31	json	[{"pk": 37, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"two-up-light\\">\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Lube Design</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>A properly designed lubrication system is essential to the long term profitability of a compressor operation. Proper designs keep mechanical wear to a minimum as well as ensure that only the proper amount of lube is consumed. factors such as rod and piston diameters, operating pressures, field conditions, and gas composition all need to be balanced in a proper design. Part of the design process is scientific, part of the design process is rooted in years of experience. Guardient personnel are the best in the industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>On Site Analysis</h2>\\n\\n\\t\\t<p>In situations where a problem is recurring and can\\u2019t seem to be isolated, an on site analysis is the first step in long term resolution. Give us a call and we\\u2019ll be happy to discuss the problem. Sometimes the problem isn\\u2019t as complicated as it seems and can be identified just by talking through it with one of our knowledgeable people.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Lube Design A...
2943	186	38	38	31	json	[{"pk": 38, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - service-trucks.png\\" id=\\"plugin_obj_39\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2944	186	39	39	25	json	[{"pk": 39, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/service-trucks.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	service-trucks.png
2945	186	50	50	10	json	[{"pk": 50, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T21:04:19.642Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 26, "position": 3, "placeholder": 34, "plugin_type": "TextPlugin"}}]	50
2946	186	29	29	10	json	[{"pk": 29, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T21:04:19.593Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:34:15.847Z", "lft": 1, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "TextPlugin"}}]	29
2947	186	8	8	16	json	[{"pk": 8, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Services", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 8, "published": true, "path": "services", "publisher_state": 0, "creation_date": "2014-09-14T20:34:02.850Z", "slug": "services", "publisher_public": 9}}]	Services (services, en)
2948	186	50	50	31	json	[{"pk": 50, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"two-up-blue\\">\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Installation</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>A properly installed lubrication system will eliminate many headaches you will otherwise encounter. In fact, poorly or improperly installed systems are one of the leading causes of system problems. The installation teams at Guardiant are sticklers for getting every detail right.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Stand Alone Lube System</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant builds stand alone lubrication systems that can be set up anywhere, that run independent of any compressor drives, and are designed to fit your specific lubrication needs. The applications for these versatile units are wide open. Anywhere an independant and precision lube source is required.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Installation A properly...
2949	186	30	30	10	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:43:17.344Z", "parent": 29, "language": "en", "level": 1, "creation_date": "2014-09-14T20:34:22.410Z", "lft": 2, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	30
2950	186	61	61	31	json	[{"pk": 61, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact Us\\" id=\\"plugin_obj_62\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link - Contact Us\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_63\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link - Find a distributor\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
2951	186	62	62	28	json	[{"pk": 62, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact Us", "url": "", "page_link": null, "phone": "", "anchor": "", "target": ""}}]	Contact Us
2952	186	63	63	10	json	[{"pk": 63, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-14T21:04:19.578Z", "parent": 61, "language": "en", "level": 1, "creation_date": "2014-09-14T19:59:18.874Z", "lft": 4, "tree_id": 33, "position": 1, "placeholder": 34, "plugin_type": "LinkPlugin"}}]	63
2953	186	37	37	10	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T21:04:19.615Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 21, "position": 1, "placeholder": 34, "plugin_type": "TextPlugin"}}]	37
2954	186	38	38	10	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T21:04:19.629Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:47:30.733Z", "lft": 1, "tree_id": 22, "position": 2, "placeholder": 34, "plugin_type": "TextPlugin"}}]	38
2955	186	39	39	10	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:47:45.231Z", "parent": 38, "language": "en", "level": 1, "creation_date": "2014-09-14T20:47:36.482Z", "lft": 2, "tree_id": 22, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	39
2956	186	61	61	10	json	[{"pk": 61, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-14T21:04:19.606Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:51:07.209Z", "lft": 1, "tree_id": 33, "position": 4, "placeholder": 34, "plugin_type": "TextPlugin"}}]	61
2957	186	62	62	10	json	[{"pk": 62, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T21:04:19.564Z", "parent": 61, "language": "en", "level": 1, "creation_date": "2014-09-14T19:58:57.858Z", "lft": 2, "tree_id": 33, "position": 0, "placeholder": 34, "plugin_type": "LinkPlugin"}}]	62
2958	186	63	63	28	json	[{"pk": 63, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
2959	187	8	8	11	json	[{"pk": 8, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 8, "placeholders": [34, 35], "changed_date": "2014-09-14T21:04:23.064Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T20:35:41.020Z", "creation_date": "2014-09-14T20:34:02.734Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Services
2960	187	29	29	31	json	[{"pk": 29, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - services-banner_1.png\\" id=\\"plugin_obj_30\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2961	187	30	30	25	json	[{"pk": 30, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/services-banner_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	services-banner_1.png
2962	187	34	34	9	json	[{"pk": 34, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2963	187	35	35	9	json	[{"pk": 35, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2964	187	37	37	31	json	[{"pk": 37, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"two-up-light\\">\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Lube Design</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>A properly designed lubrication system is essential to the long term profitability of a compressor operation. Proper designs keep mechanical wear to a minimum as well as ensure that only the proper amount of lube is consumed. factors such as rod and piston diameters, operating pressures, field conditions, and gas composition all need to be balanced in a proper design. Part of the design process is scientific, part of the design process is rooted in years of experience. Guardient personnel are the best in the industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>On Site Analysis</h2>\\n\\n\\t\\t<p>In situations where a problem is recurring and can\\u2019t seem to be isolated, an on site analysis is the first step in long term resolution. Give us a call and we\\u2019ll be happy to discuss the problem. Sometimes the problem isn\\u2019t as complicated as it seems and can be identified just by talking through it with one of our knowledgeable people.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Lube Design A...
2965	187	38	38	31	json	[{"pk": 38, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - service-trucks.png\\" id=\\"plugin_obj_39\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2966	187	39	39	25	json	[{"pk": 39, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/service-trucks.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	service-trucks.png
2967	187	50	50	10	json	[{"pk": 50, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T21:04:19.642Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 26, "position": 3, "placeholder": 34, "plugin_type": "TextPlugin"}}]	50
2968	187	29	29	10	json	[{"pk": 29, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T21:04:19.593Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:34:15.847Z", "lft": 1, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "TextPlugin"}}]	29
2969	187	8	8	16	json	[{"pk": 8, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Services", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 8, "published": true, "path": "services", "publisher_state": 1, "creation_date": "2014-09-14T20:34:02.850Z", "slug": "services", "publisher_public": 9}}]	Services (services, en)
2970	187	50	50	31	json	[{"pk": 50, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"two-up-blue\\">\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Installation</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>A properly installed lubrication system will eliminate many headaches you will otherwise encounter. In fact, poorly or improperly installed systems are one of the leading causes of system problems. The installation teams at Guardiant are sticklers for getting every detail right.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Stand Alone Lube System</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant builds stand alone lubrication systems that can be set up anywhere, that run independent of any compressor drives, and are designed to fit your specific lubrication needs. The applications for these versatile units are wide open. Anywhere an independant and precision lube source is required.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Installation A properly...
2971	187	30	30	10	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:43:17.344Z", "parent": 29, "language": "en", "level": 1, "creation_date": "2014-09-14T20:34:22.410Z", "lft": 2, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	30
3018	192	83	83	25	json	[{"pk": 83, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/10/distributors-banner.jpg", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	distributors-banner.jpg
2972	187	61	61	31	json	[{"pk": 61, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"help-container\\">\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact Us\\" id=\\"plugin_obj_62\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link - Contact Us\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_63\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link - Find a distributor\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
2973	187	62	62	28	json	[{"pk": 62, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact Us", "url": "", "page_link": null, "phone": "", "anchor": "", "target": ""}}]	Contact Us
2974	187	63	63	10	json	[{"pk": 63, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-14T21:04:19.578Z", "parent": 61, "language": "en", "level": 1, "creation_date": "2014-09-14T19:59:18.874Z", "lft": 4, "tree_id": 33, "position": 1, "placeholder": 34, "plugin_type": "LinkPlugin"}}]	63
2975	187	37	37	10	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T21:04:19.615Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 21, "position": 1, "placeholder": 34, "plugin_type": "TextPlugin"}}]	37
2976	187	38	38	10	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T21:04:19.629Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:47:30.733Z", "lft": 1, "tree_id": 22, "position": 2, "placeholder": 34, "plugin_type": "TextPlugin"}}]	38
2977	187	39	39	10	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:47:45.231Z", "parent": 38, "language": "en", "level": 1, "creation_date": "2014-09-14T20:47:36.482Z", "lft": 2, "tree_id": 22, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	39
2978	187	61	61	10	json	[{"pk": 61, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-14T21:05:41.238Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:51:07.209Z", "lft": 1, "tree_id": 33, "position": 4, "placeholder": 34, "plugin_type": "TextPlugin"}}]	61
2979	187	62	62	10	json	[{"pk": 62, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T21:04:19.564Z", "parent": 61, "language": "en", "level": 1, "creation_date": "2014-09-14T19:58:57.858Z", "lft": 2, "tree_id": 33, "position": 0, "placeholder": 34, "plugin_type": "LinkPlugin"}}]	62
2980	187	63	63	28	json	[{"pk": 63, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
2981	188	8	8	11	json	[{"pk": 8, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 8, "placeholders": [34, 35], "changed_date": "2014-09-14T21:05:54.515Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T20:35:41.020Z", "creation_date": "2014-09-14T20:34:02.734Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Services
2982	188	29	29	31	json	[{"pk": 29, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - services-banner_1.png\\" id=\\"plugin_obj_30\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2983	188	30	30	25	json	[{"pk": 30, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/services-banner_1.png", "float": "center", "page_link": null, "alt": "", "longdesc": ""}}]	services-banner_1.png
2984	188	34	34	9	json	[{"pk": 34, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2985	188	35	35	9	json	[{"pk": 35, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
2986	188	37	37	31	json	[{"pk": 37, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"two-up-light\\">\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Lube Design</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>A properly designed lubrication system is essential to the long term profitability of a compressor operation. Proper designs keep mechanical wear to a minimum as well as ensure that only the proper amount of lube is consumed. factors such as rod and piston diameters, operating pressures, field conditions, and gas composition all need to be balanced in a proper design. Part of the design process is scientific, part of the design process is rooted in years of experience. Guardient personnel are the best in the industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>On Site Analysis</h2>\\n\\n\\t\\t<p>In situations where a problem is recurring and can\\u2019t seem to be isolated, an on site analysis is the first step in long term resolution. Give us a call and we\\u2019ll be happy to discuss the problem. Sometimes the problem isn\\u2019t as complicated as it seems and can be identified just by talking through it with one of our knowledgeable people.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Lube Design A...
2987	188	38	38	31	json	[{"pk": 38, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - service-trucks.png\\" id=\\"plugin_obj_39\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
2988	188	39	39	25	json	[{"pk": 39, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/8/service-trucks.png", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	service-trucks.png
2989	188	50	50	10	json	[{"pk": 50, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T21:04:19.642Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 26, "position": 3, "placeholder": 34, "plugin_type": "TextPlugin"}}]	50
2990	188	29	29	10	json	[{"pk": 29, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T21:04:19.593Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:34:15.847Z", "lft": 1, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "TextPlugin"}}]	29
3019	192	39	39	9	json	[{"pk": 39, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
2991	188	8	8	16	json	[{"pk": 8, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Services", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 8, "published": true, "path": "services", "publisher_state": 0, "creation_date": "2014-09-14T20:34:02.850Z", "slug": "services", "publisher_public": 9}}]	Services (services, en)
2992	188	50	50	31	json	[{"pk": 50, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"two-up-blue\\">\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Installation</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>A properly installed lubrication system will eliminate many headaches you will otherwise encounter. In fact, poorly or improperly installed systems are one of the leading causes of system problems. The installation teams at Guardiant are sticklers for getting every detail right.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>Stand Alone Lube System</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant builds stand alone lubrication systems that can be set up anywhere, that run independent of any compressor drives, and are designed to fit your specific lubrication needs. The applications for these versatile units are wide open. Anywhere an independant and precision lube source is required.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Installation A properly...
2993	188	30	30	10	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:43:17.344Z", "parent": 29, "language": "en", "level": 1, "creation_date": "2014-09-14T20:34:22.410Z", "lft": 2, "tree_id": 17, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	30
2994	188	61	61	31	json	[{"pk": 61, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul class=\\"help-container\\">\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact Us\\" id=\\"plugin_obj_62\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link - Contact Us\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_63\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link - Find a distributor\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
2995	188	62	62	28	json	[{"pk": 62, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact Us", "url": "", "page_link": null, "phone": "", "anchor": "", "target": ""}}]	Contact Us
2996	188	63	63	10	json	[{"pk": 63, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-14T21:04:19.578Z", "parent": 61, "language": "en", "level": 1, "creation_date": "2014-09-14T19:59:18.874Z", "lft": 4, "tree_id": 33, "position": 1, "placeholder": 34, "plugin_type": "LinkPlugin"}}]	63
2997	188	37	37	10	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T21:04:19.615Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 21, "position": 1, "placeholder": 34, "plugin_type": "TextPlugin"}}]	37
2998	188	38	38	10	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T21:04:19.629Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:47:30.733Z", "lft": 1, "tree_id": 22, "position": 2, "placeholder": 34, "plugin_type": "TextPlugin"}}]	38
2999	188	39	39	10	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T20:47:45.231Z", "parent": 38, "language": "en", "level": 1, "creation_date": "2014-09-14T20:47:36.482Z", "lft": 2, "tree_id": 22, "position": 0, "placeholder": 34, "plugin_type": "PicturePlugin"}}]	39
3000	188	61	61	10	json	[{"pk": 61, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-14T21:05:41.238Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:51:07.209Z", "lft": 1, "tree_id": 33, "position": 4, "placeholder": 34, "plugin_type": "TextPlugin"}}]	61
3001	188	62	62	10	json	[{"pk": 62, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T21:04:19.564Z", "parent": 61, "language": "en", "level": 1, "creation_date": "2014-09-14T19:58:57.858Z", "lft": 2, "tree_id": 33, "position": 0, "placeholder": 34, "plugin_type": "LinkPlugin"}}]	62
3002	188	63	63	28	json	[{"pk": 63, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
3004	189	10	10	11	json	[{"pk": 10, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 10, "placeholders": [39, 40], "changed_date": "2014-09-14T21:13:18.115Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": null, "creation_date": "2014-09-14T21:13:18.011Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Distributors
3005	189	10	10	16	json	[{"pk": 10, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Distributors", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 10, "published": false, "path": "distributors", "publisher_state": 1, "creation_date": "2014-09-14T21:13:18.112Z", "slug": "distributors", "publisher_public": null}}]	Distributors (distributors, en)
3006	189	39	39	9	json	[{"pk": 39, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3863	253	86	86	25	json	[{"pk": 86, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/7/contact-us-banner.jpg", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	contact-us-banner.jpg
3864	253	85	85	10	json	[{"pk": 85, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T22:38:31.215Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T22:38:10.897Z", "lft": 1, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "TextPlugin"}}]	85
3008	190	10	10	11	json	[{"pk": 10, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 10, "placeholders": [39, 40], "changed_date": "2014-09-14T21:13:18.228Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": null, "creation_date": "2014-09-14T21:13:18.011Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Distributors
3009	190	10	10	16	json	[{"pk": 10, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Distributors", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 10, "published": false, "path": "distributors", "publisher_state": 1, "creation_date": "2014-09-14T21:13:18.112Z", "slug": "distributors", "publisher_public": null}}]	Distributors (distributors, en)
3010	190	82	82	10	json	[{"pk": 82, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T21:13:37.907Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T21:13:37.902Z", "lft": 1, "tree_id": 39, "position": 0, "placeholder": 39, "plugin_type": "TextPlugin"}}]	82
3011	190	39	39	9	json	[{"pk": 39, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3014	191	10	10	16	json	[{"pk": 10, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Distributors", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 10, "published": false, "path": "distributors", "publisher_state": 1, "creation_date": "2014-09-14T21:13:18.112Z", "slug": "distributors", "publisher_public": null}}]	Distributors (distributors, en)
3015	191	82	82	10	json	[{"pk": 82, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T21:13:37.907Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T21:13:37.902Z", "lft": 1, "tree_id": 39, "position": 0, "placeholder": 39, "plugin_type": "TextPlugin"}}]	82
3016	191	83	83	10	json	[{"pk": 83, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T21:13:42.833Z", "parent": 82, "language": "en", "level": 1, "creation_date": "2014-09-14T21:13:42.824Z", "lft": 2, "tree_id": 39, "position": 0, "placeholder": 39, "plugin_type": "PicturePlugin"}}]	83
3017	191	10	10	11	json	[{"pk": 10, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 10, "placeholders": [39, 40], "changed_date": "2014-09-14T21:13:37.961Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": null, "creation_date": "2014-09-14T21:13:18.011Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Distributors
3865	254	32	32	9	json	[{"pk": 32, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3866	254	33	33	9	json	[{"pk": 33, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3867	254	86	86	10	json	[{"pk": 86, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T22:38:31.174Z", "parent": 85, "language": "en", "level": 1, "creation_date": "2014-09-14T22:38:15.230Z", "lft": 2, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "PicturePlugin"}}]	86
3868	254	7	7	11	json	[{"pk": 7, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 7, "placeholders": [32, 33], "changed_date": "2014-09-21T02:19:48.208Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T22:38:35.974Z", "creation_date": "2014-09-14T18:50:32.945Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Contact Us
3869	254	7	7	16	json	[{"pk": 7, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Contact Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 7, "published": true, "path": "contact-us", "publisher_state": 1, "creation_date": "2014-09-14T18:50:33.093Z", "slug": "contact-us", "publisher_public": 11}}]	Contact Us (contact-us, en)
3870	254	85	85	31	json	[{"pk": 85, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - contact-us-banner.jpg\\" id=\\"plugin_obj_86\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
3871	254	86	86	25	json	[{"pk": 86, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/7/contact-us-banner.jpg", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	contact-us-banner.jpg
3872	254	85	85	10	json	[{"pk": 85, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T22:38:31.215Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T22:38:10.897Z", "lft": 1, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "TextPlugin"}}]	85
3021	192	10	10	11	json	[{"pk": 10, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 10, "placeholders": [39, 40], "changed_date": "2014-09-14T21:13:42.891Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": null, "creation_date": "2014-09-14T21:13:18.011Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Distributors
3022	192	82	82	10	json	[{"pk": 82, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T21:13:37.907Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T21:13:37.902Z", "lft": 1, "tree_id": 39, "position": 0, "placeholder": 39, "plugin_type": "TextPlugin"}}]	82
3023	192	83	83	10	json	[{"pk": 83, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T21:13:52.945Z", "parent": 82, "language": "en", "level": 1, "creation_date": "2014-09-14T21:13:42.824Z", "lft": 2, "tree_id": 39, "position": 0, "placeholder": 39, "plugin_type": "PicturePlugin"}}]	83
3024	192	10	10	16	json	[{"pk": 10, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Distributors", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 10, "published": false, "path": "distributors", "publisher_state": 1, "creation_date": "2014-09-14T21:13:18.112Z", "slug": "distributors", "publisher_public": null}}]	Distributors (distributors, en)
3032	193	10	10	16	json	[{"pk": 10, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Distributors", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 10, "published": false, "path": "distributors", "publisher_state": 1, "creation_date": "2014-09-14T21:13:18.112Z", "slug": "distributors", "publisher_public": null}}]	Distributors (distributors, en)
3033	194	83	83	25	json	[{"pk": 83, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/10/distributors-banner.jpg", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	distributors-banner.jpg
3034	194	39	39	9	json	[{"pk": 39, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3035	194	40	40	9	json	[{"pk": 40, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3036	194	10	10	11	json	[{"pk": 10, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 10, "placeholders": [39, 40], "changed_date": "2014-09-14T21:13:54.593Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": null, "creation_date": "2014-09-14T21:13:18.011Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Distributors
3037	194	82	82	31	json	[{"pk": 82, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - distributors-banner.jpg\\" id=\\"plugin_obj_83\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
3038	194	82	82	10	json	[{"pk": 82, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T21:13:54.470Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T21:13:37.902Z", "lft": 1, "tree_id": 39, "position": 0, "placeholder": 39, "plugin_type": "TextPlugin"}}]	82
3039	194	83	83	10	json	[{"pk": 83, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T21:13:52.945Z", "parent": 82, "language": "en", "level": 1, "creation_date": "2014-09-14T21:13:42.824Z", "lft": 2, "tree_id": 39, "position": 0, "placeholder": 39, "plugin_type": "PicturePlugin"}}]	83
3040	194	84	84	41	json	[{"pk": 84, "model": "cmsplugin_search.searchpluginconfig", "fields": {"template": "cmsplugin_search/gallery.html", "search_identifier": "Some _sweet_id"}}]	84
3041	194	84	84	10	json	[{"pk": 84, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T21:29:57.324Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T21:29:18.022Z", "lft": 1, "tree_id": 40, "position": 2, "placeholder": 39, "plugin_type": "GuardiantSearchPlugin"}}]	84
3042	194	10	10	16	json	[{"pk": 10, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Distributors", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 10, "published": false, "path": "distributors", "publisher_state": 1, "creation_date": "2014-09-14T21:13:18.112Z", "slug": "distributors", "publisher_public": null}}]	Distributors (distributors, en)
3043	195	83	83	25	json	[{"pk": 83, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/10/distributors-banner.jpg", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	distributors-banner.jpg
3044	195	39	39	9	json	[{"pk": 39, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3045	195	40	40	9	json	[{"pk": 40, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3046	195	10	10	11	json	[{"pk": 10, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 10, "placeholders": [39, 40], "changed_date": "2014-09-14T21:29:57.473Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": null, "creation_date": "2014-09-14T21:13:18.011Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Distributors
3047	195	82	82	31	json	[{"pk": 82, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - distributors-banner.jpg\\" id=\\"plugin_obj_83\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
3048	195	82	82	10	json	[{"pk": 82, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T21:13:54.470Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T21:13:37.902Z", "lft": 1, "tree_id": 39, "position": 0, "placeholder": 39, "plugin_type": "TextPlugin"}}]	82
3049	195	83	83	10	json	[{"pk": 83, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T21:13:52.945Z", "parent": 82, "language": "en", "level": 1, "creation_date": "2014-09-14T21:13:42.824Z", "lft": 2, "tree_id": 39, "position": 0, "placeholder": 39, "plugin_type": "PicturePlugin"}}]	83
3050	195	84	84	41	json	[{"pk": 84, "model": "cmsplugin_search.searchpluginconfig", "fields": {"template": "cmsplugin_search/gallery.html", "search_identifier": "Some _sweet_id"}}]	84
3051	195	84	84	10	json	[{"pk": 84, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T21:41:35.312Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T21:29:18.022Z", "lft": 1, "tree_id": 40, "position": 2, "placeholder": 39, "plugin_type": "GuardiantSearchPlugin"}}]	84
3052	195	10	10	16	json	[{"pk": 10, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Distributors", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 10, "published": false, "path": "distributors", "publisher_state": 1, "creation_date": "2014-09-14T21:13:18.112Z", "slug": "distributors", "publisher_public": null}}]	Distributors (distributors, en)
3053	196	83	83	25	json	[{"pk": 83, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/10/distributors-banner.jpg", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	distributors-banner.jpg
3054	196	39	39	9	json	[{"pk": 39, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3055	196	40	40	9	json	[{"pk": 40, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3056	196	10	10	11	json	[{"pk": 10, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 10, "placeholders": [39, 40], "changed_date": "2014-09-14T21:41:35.475Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": null, "creation_date": "2014-09-14T21:13:18.011Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Distributors
3057	196	82	82	31	json	[{"pk": 82, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - distributors-banner.jpg\\" id=\\"plugin_obj_83\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
3058	196	82	82	10	json	[{"pk": 82, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T21:13:54.470Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T21:13:37.902Z", "lft": 1, "tree_id": 39, "position": 0, "placeholder": 39, "plugin_type": "TextPlugin"}}]	82
3059	196	83	83	10	json	[{"pk": 83, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T21:13:52.945Z", "parent": 82, "language": "en", "level": 1, "creation_date": "2014-09-14T21:13:42.824Z", "lft": 2, "tree_id": 39, "position": 0, "placeholder": 39, "plugin_type": "PicturePlugin"}}]	83
3060	196	84	84	41	json	[{"pk": 84, "model": "cmsplugin_search.searchpluginconfig", "fields": {"template": "cmsplugin_search/distributors.html", "search_identifier": "Some _sweet_id"}}]	84
3061	196	84	84	10	json	[{"pk": 84, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T21:42:01.556Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T21:29:18.022Z", "lft": 1, "tree_id": 40, "position": 2, "placeholder": 39, "plugin_type": "GuardiantSearchPlugin"}}]	84
3062	196	10	10	16	json	[{"pk": 10, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Distributors", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 10, "published": false, "path": "distributors", "publisher_state": 1, "creation_date": "2014-09-14T21:13:18.112Z", "slug": "distributors", "publisher_public": null}}]	Distributors (distributors, en)
3112	202	32	32	9	json	[{"pk": 32, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3113	202	33	33	9	json	[{"pk": 33, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3114	202	27	27	39	json	[{"pk": 27, "model": "cmsplugin_contact.contact", "fields": {"form_layout": "cmsplugin_contact.forms.ContactForm", "recaptcha_theme": "clean", "site_email": "fdsfd@sdfds.com", "spam_protection_method": 0, "submit": "Submit", "thanks": "", "redirect_url": "", "form_name": "dsfdf", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	fdsfd@sdfds.com
3115	202	86	86	25	json	[{"pk": 86, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/7/contact-us-banner.jpg", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	contact-us-banner.jpg
3116	202	7	7	11	json	[{"pk": 7, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 7, "placeholders": [32, 33], "changed_date": "2014-09-14T22:38:36.453Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T22:38:35.974Z", "creation_date": "2014-09-14T18:50:32.945Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Contact Us
3117	202	7	7	16	json	[{"pk": 7, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Contact Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 7, "published": true, "path": "contact-us", "publisher_state": 0, "creation_date": "2014-09-14T18:50:33.093Z", "slug": "contact-us", "publisher_public": 11}}]	Contact Us (contact-us, en)
3118	202	85	85	31	json	[{"pk": 85, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - contact-us-banner.jpg\\" id=\\"plugin_obj_86\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
3119	202	86	86	10	json	[{"pk": 86, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T22:38:31.174Z", "parent": 85, "language": "en", "level": 1, "creation_date": "2014-09-14T22:38:15.230Z", "lft": 2, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "PicturePlugin"}}]	86
3120	202	27	27	10	json	[{"pk": 27, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T22:38:31.187Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:09:59.740Z", "lft": 1, "tree_id": 15, "position": 1, "placeholder": 32, "plugin_type": "ContactPlugin"}}]	27
3121	202	28	28	10	json	[{"pk": 28, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T22:38:31.199Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T20:10:29.121Z", "lft": 1, "tree_id": 16, "position": 2, "placeholder": 32, "plugin_type": "CustomContactPlugin"}}]	28
3122	202	85	85	10	json	[{"pk": 85, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T22:38:31.215Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T22:38:10.897Z", "lft": 1, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "TextPlugin"}}]	85
3147	204	1	1	11	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": "", "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "homepage.html", "tree_id": 1, "placeholders": [2, 3, 6, 7, 8, 9, 10, 11], "changed_date": "2014-09-20T14:32:48.145Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-09-02T00:20:41.416Z", "creation_date": "2014-09-02T00:20:41.259Z", "level": 0, "changed_by": "brandon", "application_urls": "", "xframe_options": 0, "revision_id": 0}}]	Home
3148	204	2	2	9	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3149	204	3	3	9	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3150	204	4	4	31	json	[{"pk": 4, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHO WE ARE</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems is a privately owned company dedicated to serving the needs of the gas \\u0003transmission industry. Guardiant's core principle is to always do the next right thing. Our mission is to be the leading lubrication systems company in this industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHAT WE DO</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems services the gas transmission industry for all it\\u2019s lubrication needs. We sell the finest parts available, service existing systems, design new lubrication systems, and provide state of the art training programs. At Guardiant, we are never satisfied with the way it\\u2019s always been done. We believe stagnation in design is moving backwards.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	WHO WE ARE...
3151	204	6	6	9	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content
3152	204	1	1	34	json	[{"pk": 1, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/homepage_gallery.html", "title": "Home page Gallery"}}]	2 image(s) in gallery
3153	204	8	8	9	json	[{"pk": 8, "model": "cms.placeholder", "fields": {"slot": "quote_content", "default_width": null}}]	quote_content
3154	204	9	9	9	json	[{"pk": 9, "model": "cms.placeholder", "fields": {"slot": "creto_content", "default_width": null}}]	creto_content
3155	204	10	10	9	json	[{"pk": 10, "model": "cms.placeholder", "fields": {"slot": "grid_content", "default_width": null}}]	grid_content
3156	204	11	11	9	json	[{"pk": 11, "model": "cms.placeholder", "fields": {"slot": "help_content", "default_width": null}}]	help_content
3157	204	12	12	28	json	[{"pk": 12, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact Us", "url": "", "page_link": null, "phone": "", "anchor": "", "target": ""}}]	Contact Us
3158	204	13	13	28	json	[{"pk": 13, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
3159	204	4	4	10	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:30:52.388Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 2, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	4
3160	204	1	1	10	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-20T14:33:37.746Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:26:42.874Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 6, "plugin_type": "CMSGalleryPlugin"}}]	1
3161	204	7	7	9	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "mission_content", "default_width": null}}]	mission_content
3162	204	8	8	31	json	[{"pk": 8, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li>\\n\\t<ul>\\n\\t\\t<li class=\\"title\\">Our Leadership</li>\\n\\t\\t<li class=\\"meaning\\">The leadership at Guardiant is headed up by Scott Roys who brings the same innovative and customer centric philosophy that he learned from his father Curtis Roys at CCT. The entire staff is peppered with familiar faces that will remind many people of the way lubrication system services have been and should be run!</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Our Leadership The...
3163	204	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": "", "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-09-02T00:20:41.372Z", "slug": "home", "publisher_public": 2}}]	Home (home, en)
3164	204	9	9	10	json	[{"pk": 9, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:46:48.387Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:46:32.123Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 10, "plugin_type": "CMSGalleryPlugin"}}]	9
3165	204	7	7	10	json	[{"pk": 7, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-20T14:32:47.898Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:38:30.478Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 8, "plugin_type": "CMSGalleryPlugin"}}]	7
3166	204	11	11	10	json	[{"pk": 11, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-14T19:59:31.307Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:51:07.209Z", "lft": 1, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "TextPlugin"}}]	11
3167	204	12	12	10	json	[{"pk": 12, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T19:59:14.136Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:58:57.858Z", "lft": 2, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	12
3168	204	13	13	10	json	[{"pk": 13, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-14T19:59:29.618Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:59:18.874Z", "lft": 4, "tree_id": 6, "position": 1, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	13
3191	205	11	11	10	json	[{"pk": 11, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-14T19:59:31.307Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:51:07.209Z", "lft": 1, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "TextPlugin"}}]	11
3169	204	11	11	31	json	[{"pk": 11, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact Us\\" id=\\"plugin_obj_12\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_13\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
3170	204	7	7	34	json	[{"pk": 7, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/grid_gallery.html", "title": "Grid Gallery"}}]	6 image(s) in gallery
3171	204	8	8	10	json	[{"pk": 8, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:48:42.335Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:48:23.267Z", "lft": 1, "tree_id": 5, "position": 0, "placeholder": 9, "plugin_type": "TextPlugin"}}]	8
3172	205	1	1	11	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": "", "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "homepage.html", "tree_id": 1, "placeholders": [2, 3, 6, 7, 8, 9, 10, 11], "changed_date": "2014-09-20T14:33:37.901Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-09-02T00:20:41.416Z", "creation_date": "2014-09-02T00:20:41.259Z", "level": 0, "changed_by": "brandon", "application_urls": "", "xframe_options": 0, "revision_id": 0}}]	Home
3173	205	2	2	9	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3174	205	3	3	9	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3175	205	4	4	31	json	[{"pk": 4, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHO WE ARE</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems is a privately owned company dedicated to serving the needs of the gas \\u0003transmission industry. Guardiant's core principle is to always do the next right thing. Our mission is to be the leading lubrication systems company in this industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHAT WE DO</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems services the gas transmission industry for all it\\u2019s lubrication needs. We sell the finest parts available, service existing systems, design new lubrication systems, and provide state of the art training programs. At Guardiant, we are never satisfied with the way it\\u2019s always been done. We believe stagnation in design is moving backwards.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	WHO WE ARE...
3176	205	6	6	9	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content
3177	205	1	1	34	json	[{"pk": 1, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/homepage_gallery.html", "title": "Home page Gallery"}}]	2 image(s) in gallery
3178	205	8	8	9	json	[{"pk": 8, "model": "cms.placeholder", "fields": {"slot": "quote_content", "default_width": null}}]	quote_content
3179	205	9	9	9	json	[{"pk": 9, "model": "cms.placeholder", "fields": {"slot": "creto_content", "default_width": null}}]	creto_content
3180	205	10	10	9	json	[{"pk": 10, "model": "cms.placeholder", "fields": {"slot": "grid_content", "default_width": null}}]	grid_content
3181	205	11	11	9	json	[{"pk": 11, "model": "cms.placeholder", "fields": {"slot": "help_content", "default_width": null}}]	help_content
3182	205	12	12	28	json	[{"pk": 12, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact Us", "url": "", "page_link": null, "phone": "", "anchor": "", "target": ""}}]	Contact Us
3183	205	13	13	28	json	[{"pk": 13, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
3184	205	4	4	10	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:30:52.388Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 2, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	4
3185	205	1	1	10	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-20T14:33:37.746Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:26:42.874Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 6, "plugin_type": "CMSGalleryPlugin"}}]	1
3186	205	7	7	9	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "mission_content", "default_width": null}}]	mission_content
3187	205	8	8	31	json	[{"pk": 8, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li>\\n\\t<ul>\\n\\t\\t<li class=\\"title\\">Our Leadership</li>\\n\\t\\t<li class=\\"meaning\\">The leadership at Guardiant is headed up by Scott Roys who brings the same innovative and customer centric philosophy that he learned from his father Curtis Roys at CCT. The entire staff is peppered with familiar faces that will remind many people of the way lubrication system services have been and should be run!</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Our Leadership The...
3188	205	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": "", "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-09-02T00:20:41.372Z", "slug": "home", "publisher_public": 2}}]	Home (home, en)
3189	205	9	9	10	json	[{"pk": 9, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:46:48.387Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:46:32.123Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 10, "plugin_type": "CMSGalleryPlugin"}}]	9
3190	205	7	7	10	json	[{"pk": 7, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-20T20:26:16.264Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:38:30.478Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 8, "plugin_type": "CMSGalleryPlugin"}}]	7
3192	205	12	12	10	json	[{"pk": 12, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T19:59:14.136Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:58:57.858Z", "lft": 2, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	12
3193	205	13	13	10	json	[{"pk": 13, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-14T19:59:29.618Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:59:18.874Z", "lft": 4, "tree_id": 6, "position": 1, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	13
3194	205	11	11	31	json	[{"pk": 11, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact Us\\" id=\\"plugin_obj_12\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_13\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
3195	205	7	7	34	json	[{"pk": 7, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/grid_gallery.html", "title": "Grid Gallery"}}]	6 image(s) in gallery
3196	205	8	8	10	json	[{"pk": 8, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:48:42.335Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:48:23.267Z", "lft": 1, "tree_id": 5, "position": 0, "placeholder": 9, "plugin_type": "TextPlugin"}}]	8
3197	206	1	1	11	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": "", "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "homepage.html", "tree_id": 1, "placeholders": [2, 3, 6, 7, 8, 9, 10, 11], "changed_date": "2014-09-20T20:26:16.539Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-09-02T00:20:41.416Z", "creation_date": "2014-09-02T00:20:41.259Z", "level": 0, "changed_by": "brandon", "application_urls": "", "xframe_options": 0, "revision_id": 0}}]	Home
3198	206	2	2	9	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3199	206	3	3	9	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3200	206	4	4	31	json	[{"pk": 4, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHO WE ARE</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems is a privately owned company dedicated to serving the needs of the gas \\u0003transmission industry. Guardiant's core principle is to always do the next right thing. Our mission is to be the leading lubrication systems company in this industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHAT WE DO</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems services the gas transmission industry for all it\\u2019s lubrication needs. We sell the finest parts available, service existing systems, design new lubrication systems, and provide state of the art training programs. At Guardiant, we are never satisfied with the way it\\u2019s always been done. We believe stagnation in design is moving backwards.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	WHO WE ARE...
3201	206	6	6	9	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content
3202	206	1	1	34	json	[{"pk": 1, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/homepage_gallery.html", "title": "Home page Gallery"}}]	2 image(s) in gallery
3203	206	8	8	9	json	[{"pk": 8, "model": "cms.placeholder", "fields": {"slot": "quote_content", "default_width": null}}]	quote_content
3204	206	9	9	9	json	[{"pk": 9, "model": "cms.placeholder", "fields": {"slot": "creto_content", "default_width": null}}]	creto_content
3205	206	10	10	9	json	[{"pk": 10, "model": "cms.placeholder", "fields": {"slot": "grid_content", "default_width": null}}]	grid_content
3206	206	11	11	9	json	[{"pk": 11, "model": "cms.placeholder", "fields": {"slot": "help_content", "default_width": null}}]	help_content
3207	206	12	12	28	json	[{"pk": 12, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact Us", "url": "", "page_link": null, "phone": "", "anchor": "", "target": ""}}]	Contact Us
3208	206	13	13	28	json	[{"pk": 13, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
3209	206	4	4	10	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:30:52.388Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 2, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	4
3210	206	1	1	10	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-20T14:33:37.746Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:26:42.874Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 6, "plugin_type": "CMSGalleryPlugin"}}]	1
3211	206	7	7	9	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "mission_content", "default_width": null}}]	mission_content
3212	206	8	8	31	json	[{"pk": 8, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li>\\n\\t<ul>\\n\\t\\t<li class=\\"title\\">Our Leadership</li>\\n\\t\\t<li class=\\"meaning\\">The leadership at Guardiant is headed up by Scott Roys who brings the same innovative and customer centric philosophy that he learned from his father Curtis Roys at CCT. The entire staff is peppered with familiar faces that will remind many people of the way lubrication system services have been and should be run!</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Our Leadership The...
3213	206	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": "", "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-09-02T00:20:41.372Z", "slug": "home", "publisher_public": 2}}]	Home (home, en)
3214	206	9	9	10	json	[{"pk": 9, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:46:48.387Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:46:32.123Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 10, "plugin_type": "CMSGalleryPlugin"}}]	9
3215	206	7	7	10	json	[{"pk": 7, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-20T20:32:37.760Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:38:30.478Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 8, "plugin_type": "CMSGalleryPlugin"}}]	7
3216	206	11	11	10	json	[{"pk": 11, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-14T19:59:31.307Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:51:07.209Z", "lft": 1, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "TextPlugin"}}]	11
3217	206	12	12	10	json	[{"pk": 12, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T19:59:14.136Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:58:57.858Z", "lft": 2, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	12
3218	206	13	13	10	json	[{"pk": 13, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-14T19:59:29.618Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:59:18.874Z", "lft": 4, "tree_id": 6, "position": 1, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	13
3219	206	11	11	31	json	[{"pk": 11, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact Us\\" id=\\"plugin_obj_12\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_13\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
3220	206	7	7	34	json	[{"pk": 7, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/grid_gallery.html", "title": "Grid Gallery"}}]	6 image(s) in gallery
3221	206	8	8	10	json	[{"pk": 8, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:48:42.335Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:48:23.267Z", "lft": 1, "tree_id": 5, "position": 0, "placeholder": 9, "plugin_type": "TextPlugin"}}]	8
3222	207	1	1	11	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": "", "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "homepage.html", "tree_id": 1, "placeholders": [2, 3, 6, 7, 8, 9, 10, 11], "changed_date": "2014-09-20T20:32:38.019Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-09-02T00:20:41.416Z", "creation_date": "2014-09-02T00:20:41.259Z", "level": 0, "changed_by": "brandon", "application_urls": "", "xframe_options": 0, "revision_id": 0}}]	Home
3223	207	2	2	9	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3224	207	3	3	9	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3225	207	4	4	31	json	[{"pk": 4, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHO WE ARE</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems is a privately owned company dedicated to serving the needs of the gas \\u0003transmission industry. Guardiant's core principle is to always do the next right thing. Our mission is to be the leading lubrication systems company in this industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHAT WE DO</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems services the gas transmission industry for all it\\u2019s lubrication needs. We sell the finest parts available, service existing systems, design new lubrication systems, and provide state of the art training programs. At Guardiant, we are never satisfied with the way it\\u2019s always been done. We believe stagnation in design is moving backwards.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	WHO WE ARE...
3226	207	6	6	9	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content
3227	207	1	1	34	json	[{"pk": 1, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/homepage_gallery.html", "title": "Home page Gallery"}}]	2 image(s) in gallery
3228	207	8	8	9	json	[{"pk": 8, "model": "cms.placeholder", "fields": {"slot": "quote_content", "default_width": null}}]	quote_content
3229	207	9	9	9	json	[{"pk": 9, "model": "cms.placeholder", "fields": {"slot": "creto_content", "default_width": null}}]	creto_content
3230	207	10	10	9	json	[{"pk": 10, "model": "cms.placeholder", "fields": {"slot": "grid_content", "default_width": null}}]	grid_content
3231	207	11	11	9	json	[{"pk": 11, "model": "cms.placeholder", "fields": {"slot": "help_content", "default_width": null}}]	help_content
3232	207	12	12	28	json	[{"pk": 12, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact Us", "url": "", "page_link": null, "phone": "", "anchor": "", "target": ""}}]	Contact Us
3233	207	13	13	28	json	[{"pk": 13, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
3234	207	4	4	10	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:30:52.388Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 2, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	4
3235	207	1	1	10	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-20T14:33:37.746Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:26:42.874Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 6, "plugin_type": "CMSGalleryPlugin"}}]	1
3236	207	7	7	9	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "mission_content", "default_width": null}}]	mission_content
3237	207	8	8	31	json	[{"pk": 8, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li>\\n\\t<ul>\\n\\t\\t<li class=\\"title\\">Our Leadership</li>\\n\\t\\t<li class=\\"meaning\\">The leadership at Guardiant is headed up by Scott Roys who brings the same innovative and customer centric philosophy that he learned from his father Curtis Roys at CCT. The entire staff is peppered with familiar faces that will remind many people of the way lubrication system services have been and should be run!</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Our Leadership The...
3238	207	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": "", "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-09-02T00:20:41.372Z", "slug": "home", "publisher_public": 2}}]	Home (home, en)
3239	207	9	9	10	json	[{"pk": 9, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:46:48.387Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:46:32.123Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 10, "plugin_type": "CMSGalleryPlugin"}}]	9
3240	207	7	7	10	json	[{"pk": 7, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-20T21:09:09.308Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:38:30.478Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 8, "plugin_type": "CMSGalleryPlugin"}}]	7
3241	207	11	11	10	json	[{"pk": 11, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-14T19:59:31.307Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:51:07.209Z", "lft": 1, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "TextPlugin"}}]	11
3242	207	12	12	10	json	[{"pk": 12, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T19:59:14.136Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:58:57.858Z", "lft": 2, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	12
3243	207	13	13	10	json	[{"pk": 13, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-14T19:59:29.618Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:59:18.874Z", "lft": 4, "tree_id": 6, "position": 1, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	13
3244	207	11	11	31	json	[{"pk": 11, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact Us\\" id=\\"plugin_obj_12\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_13\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
3245	207	7	7	34	json	[{"pk": 7, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/grid_gallery.html", "title": "Grid Gallery"}}]	6 image(s) in gallery
3246	207	8	8	10	json	[{"pk": 8, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:48:42.335Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:48:23.267Z", "lft": 1, "tree_id": 5, "position": 0, "placeholder": 9, "plugin_type": "TextPlugin"}}]	8
3768	244	32	32	9	json	[{"pk": 32, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3769	244	33	33	9	json	[{"pk": 33, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3770	244	86	86	25	json	[{"pk": 86, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/7/contact-us-banner.jpg", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	contact-us-banner.jpg
3771	244	161	161	10	json	[{"pk": 161, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-21T01:00:50.470Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-21T01:00:50.463Z", "lft": 1, "tree_id": 51, "position": 2, "placeholder": 32, "plugin_type": "CustomContactPlugin"}}]	161
3772	244	7	7	11	json	[{"pk": 7, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 7, "placeholders": [32, 33], "changed_date": "2014-09-21T00:58:51.724Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T22:38:35.974Z", "creation_date": "2014-09-14T18:50:32.945Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Contact Us
3773	244	85	85	31	json	[{"pk": 85, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - contact-us-banner.jpg\\" id=\\"plugin_obj_86\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
3774	244	86	86	10	json	[{"pk": 86, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T22:38:31.174Z", "parent": 85, "language": "en", "level": 1, "creation_date": "2014-09-14T22:38:15.230Z", "lft": 2, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "PicturePlugin"}}]	86
3775	244	7	7	16	json	[{"pk": 7, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Contact Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 7, "published": true, "path": "contact-us", "publisher_state": 1, "creation_date": "2014-09-14T18:50:33.093Z", "slug": "contact-us", "publisher_public": 11}}]	Contact Us (contact-us, en)
3776	244	85	85	10	json	[{"pk": 85, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T22:38:31.215Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T22:38:10.897Z", "lft": 1, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "TextPlugin"}}]	85
3372	213	1	1	11	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": "", "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "homepage.html", "tree_id": 1, "placeholders": [2, 3, 6, 7, 8, 9, 10, 11], "changed_date": "2014-09-20T21:21:29.366Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-09-02T00:20:41.416Z", "creation_date": "2014-09-02T00:20:41.259Z", "level": 0, "changed_by": "brandon", "application_urls": "", "xframe_options": 0, "revision_id": 0}}]	Home
3373	213	2	2	9	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3374	213	3	3	9	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3375	213	4	4	31	json	[{"pk": 4, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHO WE ARE</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems is a privately owned company dedicated to serving the needs of the gas \\u0003transmission industry. Guardiant's core principle is to always do the next right thing. Our mission is to be the leading lubrication systems company in this industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHAT WE DO</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems services the gas transmission industry for all it\\u2019s lubrication needs. We sell the finest parts available, service existing systems, design new lubrication systems, and provide state of the art training programs. At Guardiant, we are never satisfied with the way it\\u2019s always been done. We believe stagnation in design is moving backwards.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	WHO WE ARE...
3376	213	6	6	9	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content
3377	213	1	1	34	json	[{"pk": 1, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/homepage_gallery.html", "title": "Home page Gallery"}}]	2 image(s) in gallery
3378	213	8	8	9	json	[{"pk": 8, "model": "cms.placeholder", "fields": {"slot": "quote_content", "default_width": null}}]	quote_content
3379	213	9	9	9	json	[{"pk": 9, "model": "cms.placeholder", "fields": {"slot": "creto_content", "default_width": null}}]	creto_content
3380	213	10	10	9	json	[{"pk": 10, "model": "cms.placeholder", "fields": {"slot": "grid_content", "default_width": null}}]	grid_content
3381	213	11	11	9	json	[{"pk": 11, "model": "cms.placeholder", "fields": {"slot": "help_content", "default_width": null}}]	help_content
3382	213	12	12	28	json	[{"pk": 12, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact Us", "url": "", "page_link": null, "phone": "", "anchor": "", "target": ""}}]	Contact Us
3383	213	13	13	28	json	[{"pk": 13, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
3384	213	4	4	10	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:30:52.388Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 2, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	4
3385	213	1	1	10	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-20T14:33:37.746Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:26:42.874Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 6, "plugin_type": "CMSGalleryPlugin"}}]	1
3386	213	7	7	10	json	[{"pk": 7, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-20T21:09:09.308Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:38:30.478Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 8, "plugin_type": "CMSGalleryPlugin"}}]	7
3387	213	8	8	31	json	[{"pk": 8, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li>\\n\\t<ul>\\n\\t\\t<li class=\\"title\\">Our Leadership</li>\\n\\t\\t<li class=\\"meaning\\">The leadership at Guardiant is headed up by Scott Roys who brings the same innovative and customer centric philosophy that he learned from his father Curtis Roys at CCT. The entire staff is peppered with familiar faces that will remind many people of the way lubrication system services have been and should be run!</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Our Leadership The...
3388	213	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": "", "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-09-02T00:20:41.372Z", "slug": "home", "publisher_public": 2}}]	Home (home, en)
3389	213	7	7	34	json	[{"pk": 7, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/grid_gallery.html", "title": "Grid Gallery"}}]	6 image(s) in gallery
3390	213	11	11	10	json	[{"pk": 11, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-14T19:59:31.307Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:51:07.209Z", "lft": 1, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "TextPlugin"}}]	11
3391	213	12	12	10	json	[{"pk": 12, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T19:59:14.136Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:58:57.858Z", "lft": 2, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	12
3392	213	13	13	10	json	[{"pk": 13, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-14T19:59:29.618Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:59:18.874Z", "lft": 4, "tree_id": 6, "position": 1, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	13
3393	213	11	11	31	json	[{"pk": 11, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact Us\\" id=\\"plugin_obj_12\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_13\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
3394	213	7	7	9	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "mission_content", "default_width": null}}]	mission_content
3395	213	8	8	10	json	[{"pk": 8, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:48:42.335Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:48:23.267Z", "lft": 1, "tree_id": 5, "position": 0, "placeholder": 9, "plugin_type": "TextPlugin"}}]	8
3396	214	1	1	11	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": "", "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "homepage.html", "tree_id": 1, "placeholders": [2, 3, 6, 7, 8, 9, 10, 11], "changed_date": "2014-09-20T21:21:29.513Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-09-02T00:20:41.416Z", "creation_date": "2014-09-02T00:20:41.259Z", "level": 0, "changed_by": "brandon", "application_urls": "", "xframe_options": 0, "revision_id": 0}}]	Home
3397	214	2	2	9	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3398	214	3	3	9	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3399	214	4	4	31	json	[{"pk": 4, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHO WE ARE</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems is a privately owned company dedicated to serving the needs of the gas \\u0003transmission industry. Guardiant's core principle is to always do the next right thing. Our mission is to be the leading lubrication systems company in this industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHAT WE DO</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems services the gas transmission industry for all it\\u2019s lubrication needs. We sell the finest parts available, service existing systems, design new lubrication systems, and provide state of the art training programs. At Guardiant, we are never satisfied with the way it\\u2019s always been done. We believe stagnation in design is moving backwards.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	WHO WE ARE...
3400	214	6	6	9	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content
3401	214	1	1	34	json	[{"pk": 1, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/homepage_gallery.html", "title": "Home page Gallery"}}]	2 image(s) in gallery
3402	214	8	8	9	json	[{"pk": 8, "model": "cms.placeholder", "fields": {"slot": "quote_content", "default_width": null}}]	quote_content
3403	214	9	9	9	json	[{"pk": 9, "model": "cms.placeholder", "fields": {"slot": "creto_content", "default_width": null}}]	creto_content
3404	214	10	10	9	json	[{"pk": 10, "model": "cms.placeholder", "fields": {"slot": "grid_content", "default_width": null}}]	grid_content
3405	214	11	11	9	json	[{"pk": 11, "model": "cms.placeholder", "fields": {"slot": "help_content", "default_width": null}}]	help_content
3406	214	12	12	28	json	[{"pk": 12, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact Us", "url": "", "page_link": null, "phone": "", "anchor": "", "target": ""}}]	Contact Us
3407	214	13	13	28	json	[{"pk": 13, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
3408	214	4	4	10	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:30:52.388Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 2, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	4
3409	214	1	1	10	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-20T14:33:37.746Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:26:42.874Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 6, "plugin_type": "CMSGalleryPlugin"}}]	1
3410	214	7	7	10	json	[{"pk": 7, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-20T21:22:03.607Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:38:30.478Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 8, "plugin_type": "CMSGalleryPlugin"}}]	7
3411	214	8	8	31	json	[{"pk": 8, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li>\\n\\t<ul>\\n\\t\\t<li class=\\"title\\">Our Leadership</li>\\n\\t\\t<li class=\\"meaning\\">The leadership at Guardiant is headed up by Scott Roys who brings the same innovative and customer centric philosophy that he learned from his father Curtis Roys at CCT. The entire staff is peppered with familiar faces that will remind many people of the way lubrication system services have been and should be run!</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Our Leadership The...
3412	214	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": "", "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-09-02T00:20:41.372Z", "slug": "home", "publisher_public": 2}}]	Home (home, en)
3413	214	7	7	34	json	[{"pk": 7, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/grid_gallery.html", "title": "Grid Gallery"}}]	6 image(s) in gallery
3414	214	11	11	10	json	[{"pk": 11, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-14T19:59:31.307Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:51:07.209Z", "lft": 1, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "TextPlugin"}}]	11
3415	214	12	12	10	json	[{"pk": 12, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T19:59:14.136Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:58:57.858Z", "lft": 2, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	12
3416	214	13	13	10	json	[{"pk": 13, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-14T19:59:29.618Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:59:18.874Z", "lft": 4, "tree_id": 6, "position": 1, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	13
3417	214	11	11	31	json	[{"pk": 11, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact Us\\" id=\\"plugin_obj_12\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_13\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
3418	214	7	7	9	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "mission_content", "default_width": null}}]	mission_content
3419	214	8	8	10	json	[{"pk": 8, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:48:42.335Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:48:23.267Z", "lft": 1, "tree_id": 5, "position": 0, "placeholder": 9, "plugin_type": "TextPlugin"}}]	8
3420	215	1	1	11	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": "", "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "homepage.html", "tree_id": 1, "placeholders": [2, 3, 6, 7, 8, 9, 10, 11], "changed_date": "2014-09-20T21:22:03.786Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-09-02T00:20:41.416Z", "creation_date": "2014-09-02T00:20:41.259Z", "level": 0, "changed_by": "brandon", "application_urls": "", "xframe_options": 0, "revision_id": 0}}]	Home
3421	215	2	2	9	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3422	215	3	3	9	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3423	215	4	4	31	json	[{"pk": 4, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHO WE ARE</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems is a privately owned company dedicated to serving the needs of the gas \\u0003transmission industry. Guardiant's core principle is to always do the next right thing. Our mission is to be the leading lubrication systems company in this industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHAT WE DO</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems services the gas transmission industry for all it\\u2019s lubrication needs. We sell the finest parts available, service existing systems, design new lubrication systems, and provide state of the art training programs. At Guardiant, we are never satisfied with the way it\\u2019s always been done. We believe stagnation in design is moving backwards.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	WHO WE ARE...
3424	215	6	6	9	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content
3425	215	1	1	34	json	[{"pk": 1, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/homepage_gallery.html", "title": "Home page Gallery"}}]	2 image(s) in gallery
3426	215	8	8	9	json	[{"pk": 8, "model": "cms.placeholder", "fields": {"slot": "quote_content", "default_width": null}}]	quote_content
3427	215	9	9	9	json	[{"pk": 9, "model": "cms.placeholder", "fields": {"slot": "creto_content", "default_width": null}}]	creto_content
3428	215	10	10	9	json	[{"pk": 10, "model": "cms.placeholder", "fields": {"slot": "grid_content", "default_width": null}}]	grid_content
3429	215	11	11	9	json	[{"pk": 11, "model": "cms.placeholder", "fields": {"slot": "help_content", "default_width": null}}]	help_content
3430	215	12	12	28	json	[{"pk": 12, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact Us", "url": "", "page_link": null, "phone": "", "anchor": "", "target": ""}}]	Contact Us
3431	215	13	13	28	json	[{"pk": 13, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
3432	215	4	4	10	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:30:52.388Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 2, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	4
3433	215	1	1	10	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-20T14:33:37.746Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:26:42.874Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 6, "plugin_type": "CMSGalleryPlugin"}}]	1
3777	245	32	32	9	json	[{"pk": 32, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3434	215	7	7	10	json	[{"pk": 7, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-20T21:22:07.421Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:38:30.478Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 8, "plugin_type": "CMSGalleryPlugin"}}]	7
3435	215	8	8	31	json	[{"pk": 8, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li>\\n\\t<ul>\\n\\t\\t<li class=\\"title\\">Our Leadership</li>\\n\\t\\t<li class=\\"meaning\\">The leadership at Guardiant is headed up by Scott Roys who brings the same innovative and customer centric philosophy that he learned from his father Curtis Roys at CCT. The entire staff is peppered with familiar faces that will remind many people of the way lubrication system services have been and should be run!</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Our Leadership The...
3436	215	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": "", "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-09-02T00:20:41.372Z", "slug": "home", "publisher_public": 2}}]	Home (home, en)
3437	215	7	7	34	json	[{"pk": 7, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/grid_gallery.html", "title": "Grid Gallery"}}]	6 image(s) in gallery
3438	215	11	11	10	json	[{"pk": 11, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-14T19:59:31.307Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:51:07.209Z", "lft": 1, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "TextPlugin"}}]	11
3439	215	12	12	10	json	[{"pk": 12, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T19:59:14.136Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:58:57.858Z", "lft": 2, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	12
3440	215	13	13	10	json	[{"pk": 13, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-14T19:59:29.618Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:59:18.874Z", "lft": 4, "tree_id": 6, "position": 1, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	13
3441	215	11	11	31	json	[{"pk": 11, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact Us\\" id=\\"plugin_obj_12\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_13\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
3442	215	7	7	9	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "mission_content", "default_width": null}}]	mission_content
3443	215	8	8	10	json	[{"pk": 8, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:48:42.335Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:48:23.267Z", "lft": 1, "tree_id": 5, "position": 0, "placeholder": 9, "plugin_type": "TextPlugin"}}]	8
3444	216	1	1	11	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": "", "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "homepage.html", "tree_id": 1, "placeholders": [2, 3, 6, 7, 8, 9, 10, 11], "changed_date": "2014-09-20T21:22:07.565Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-09-02T00:20:41.416Z", "creation_date": "2014-09-02T00:20:41.259Z", "level": 0, "changed_by": "brandon", "application_urls": "", "xframe_options": 0, "revision_id": 0}}]	Home
3445	216	2	2	9	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3446	216	3	3	9	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3447	216	4	4	31	json	[{"pk": 4, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHO WE ARE</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems is a privately owned company dedicated to serving the needs of the gas \\u0003transmission industry. Guardiant's core principle is to always do the next right thing. Our mission is to be the leading lubrication systems company in this industry.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>WHAT WE DO</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant Lubrication Systems services the gas transmission industry for all it\\u2019s lubrication needs. We sell the finest parts available, service existing systems, design new lubrication systems, and provide state of the art training programs. At Guardiant, we are never satisfied with the way it\\u2019s always been done. We believe stagnation in design is moving backwards.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	WHO WE ARE...
3448	216	6	6	9	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "slideshow_content", "default_width": null}}]	slideshow_content
3449	216	1	1	34	json	[{"pk": 1, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/homepage_gallery.html", "title": "Home page Gallery"}}]	2 image(s) in gallery
3450	216	8	8	9	json	[{"pk": 8, "model": "cms.placeholder", "fields": {"slot": "quote_content", "default_width": null}}]	quote_content
3451	216	9	9	9	json	[{"pk": 9, "model": "cms.placeholder", "fields": {"slot": "creto_content", "default_width": null}}]	creto_content
3452	216	10	10	9	json	[{"pk": 10, "model": "cms.placeholder", "fields": {"slot": "grid_content", "default_width": null}}]	grid_content
3453	216	11	11	9	json	[{"pk": 11, "model": "cms.placeholder", "fields": {"slot": "help_content", "default_width": null}}]	help_content
3454	216	12	12	28	json	[{"pk": 12, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Contact Us", "url": "", "page_link": null, "phone": "", "anchor": "", "target": ""}}]	Contact Us
3455	216	13	13	28	json	[{"pk": 13, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Find a distributor", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Find a distributor
3456	216	4	4	10	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:30:52.388Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:30:44.332Z", "lft": 1, "tree_id": 2, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	4
3457	216	1	1	10	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-20T14:33:37.746Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:26:42.874Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 6, "plugin_type": "CMSGalleryPlugin"}}]	1
3458	216	7	7	10	json	[{"pk": 7, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-20T21:22:11.111Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:38:30.478Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 8, "plugin_type": "CMSGalleryPlugin"}}]	7
3459	216	8	8	31	json	[{"pk": 8, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li>\\n\\t<ul>\\n\\t\\t<li class=\\"title\\">Our Leadership</li>\\n\\t\\t<li class=\\"meaning\\">The leadership at Guardiant is headed up by Scott Roys who brings the same innovative and customer centric philosophy that he learned from his father Curtis Roys at CCT. The entire staff is peppered with familiar faces that will remind many people of the way lubrication system services have been and should be run!</li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	Our Leadership The...
3460	216	1	1	16	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": "", "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-09-02T00:20:41.372Z", "slug": "home", "publisher_public": 2}}]	Home (home, en)
3461	216	7	7	34	json	[{"pk": 7, "model": "cmsplugin_gallery.galleryplugin", "fields": {"slide_duration": 3.0, "fade_duration": 1.0, "template": "cmsplugin_gallery/grid_gallery.html", "title": "Grid Gallery"}}]	6 image(s) in gallery
3462	216	11	11	10	json	[{"pk": 11, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-09-14T19:59:31.307Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:51:07.209Z", "lft": 1, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "TextPlugin"}}]	11
3463	216	12	12	10	json	[{"pk": 12, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T19:59:14.136Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:58:57.858Z", "lft": 2, "tree_id": 6, "position": 0, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	12
3464	216	13	13	10	json	[{"pk": 13, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-09-14T19:59:29.618Z", "parent": 11, "language": "en", "level": 1, "creation_date": "2014-09-14T19:59:18.874Z", "lft": 4, "tree_id": 6, "position": 1, "placeholder": 11, "plugin_type": "LinkPlugin"}}]	13
3465	216	11	11	31	json	[{"pk": 11, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<ul>\\n\\t<li class=\\"left-column\\">\\n\\t<ul>\\n\\t\\t<li>\\n\\t\\t<h2>How can we help you?</h2>\\n\\t\\t</li>\\n\\t\\t<li>\\n\\t\\t<p>Guardiant keeps a full stock of OEM and direct replacement parts for complete compressor lubrication systems, both high and low pressure. Guardiant employs well trained and experienced technicians ready to fix the tough issues that arise. When your workforce is ready for the best training available, whether it\\u2019s introductory or advanced, Guardiant is ready to fill that need too.</p>\\n\\t\\t</li>\\n\\t</ul>\\n\\t</li>\\n\\t<li class=\\"right-column\\">\\n\\t<ul>\\n\\t\\t<li><img title=\\"Link - Contact Us\\" id=\\"plugin_obj_12\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t\\t<li><img title=\\"Link - Find a distributor\\" id=\\"plugin_obj_13\\" src=\\"/static/cms/img/icons/plugins/link.png\\" alt=\\"Link\\"></li>\\n\\t</ul>\\n\\t</li>\\n</ul>\\n"}}]	How can we...
3466	216	7	7	9	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "mission_content", "default_width": null}}]	mission_content
3467	216	8	8	10	json	[{"pk": 8, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-14T19:48:42.335Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T19:48:23.267Z", "lft": 1, "tree_id": 5, "position": 0, "placeholder": 9, "plugin_type": "TextPlugin"}}]	8
3778	245	33	33	9	json	[{"pk": 33, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3779	245	162	162	10	json	[{"pk": 162, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-21T01:41:16.871Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-21T01:41:16.863Z", "lft": 1, "tree_id": 51, "position": 2, "placeholder": 32, "plugin_type": "ContactPlugin"}}]	162
3780	245	86	86	25	json	[{"pk": 86, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/7/contact-us-banner.jpg", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	contact-us-banner.jpg
3781	245	7	7	11	json	[{"pk": 7, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 7, "placeholders": [32, 33], "changed_date": "2014-09-21T01:00:50.523Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T22:38:35.974Z", "creation_date": "2014-09-14T18:50:32.945Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Contact Us
3782	245	7	7	16	json	[{"pk": 7, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Contact Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 7, "published": true, "path": "contact-us", "publisher_state": 1, "creation_date": "2014-09-14T18:50:33.093Z", "slug": "contact-us", "publisher_public": 11}}]	Contact Us (contact-us, en)
3783	245	85	85	31	json	[{"pk": 85, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - contact-us-banner.jpg\\" id=\\"plugin_obj_86\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
3784	245	86	86	10	json	[{"pk": 86, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T22:38:31.174Z", "parent": 85, "language": "en", "level": 1, "creation_date": "2014-09-14T22:38:15.230Z", "lft": 2, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "PicturePlugin"}}]	86
3785	245	85	85	10	json	[{"pk": 85, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T22:38:31.215Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T22:38:10.897Z", "lft": 1, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "TextPlugin"}}]	85
3786	246	32	32	9	json	[{"pk": 32, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3787	246	33	33	9	json	[{"pk": 33, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3788	246	162	162	39	json	[{"pk": 162, "model": "cmsplugin_contact.contact", "fields": {"form_layout": "cmsplugin_contact.forms.ContactForm", "recaptcha_theme": "clean", "site_email": "blorenz@gmail.com", "spam_protection_method": 0, "submit": "Submit", "thanks": "", "redirect_url": "", "form_name": "Something", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	blorenz@gmail.com
3789	246	86	86	25	json	[{"pk": 86, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/7/contact-us-banner.jpg", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	contact-us-banner.jpg
3790	246	7	7	11	json	[{"pk": 7, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 7, "placeholders": [32, 33], "changed_date": "2014-09-21T01:41:16.971Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T22:38:35.974Z", "creation_date": "2014-09-14T18:50:32.945Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Contact Us
3791	246	7	7	16	json	[{"pk": 7, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Contact Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 7, "published": true, "path": "contact-us", "publisher_state": 1, "creation_date": "2014-09-14T18:50:33.093Z", "slug": "contact-us", "publisher_public": 11}}]	Contact Us (contact-us, en)
3792	246	162	162	10	json	[{"pk": 162, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-21T01:42:07.680Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-21T01:41:16.863Z", "lft": 1, "tree_id": 51, "position": 2, "placeholder": 32, "plugin_type": "ContactPlugin"}}]	162
3793	246	85	85	31	json	[{"pk": 85, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - contact-us-banner.jpg\\" id=\\"plugin_obj_86\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
3794	246	86	86	10	json	[{"pk": 86, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T22:38:31.174Z", "parent": 85, "language": "en", "level": 1, "creation_date": "2014-09-14T22:38:15.230Z", "lft": 2, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "PicturePlugin"}}]	86
3795	246	85	85	10	json	[{"pk": 85, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T22:38:31.215Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T22:38:10.897Z", "lft": 1, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "TextPlugin"}}]	85
3796	247	32	32	9	json	[{"pk": 32, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3797	247	33	33	9	json	[{"pk": 33, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
3798	247	162	162	39	json	[{"pk": 162, "model": "cmsplugin_contact.contact", "fields": {"form_layout": "cmsplugin_contact.forms.ContactForm", "recaptcha_theme": "clean", "site_email": "blorenz@gmail.com", "spam_protection_method": 0, "submit": "Submit", "thanks": "", "redirect_url": "", "form_name": "Something", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	blorenz@gmail.com
3799	247	163	163	10	json	[{"pk": 163, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-21T02:05:55.619Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-21T02:05:55.611Z", "lft": 1, "tree_id": 52, "position": 3, "placeholder": 32, "plugin_type": "GuardiantContactPlugin"}}]	163
3800	247	86	86	25	json	[{"pk": 86, "model": "djangocms_picture.picture", "fields": {"url": "", "image": "cms_page_media/7/contact-us-banner.jpg", "float": null, "page_link": null, "alt": "", "longdesc": ""}}]	contact-us-banner.jpg
3801	247	7	7	11	json	[{"pk": 7, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "brandon", "languages": "en", "publication_end_date": null, "template": "INHERIT", "tree_id": 7, "placeholders": [32, 33], "changed_date": "2014-09-21T01:42:07.765Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": false, "publication_date": "2014-09-14T22:38:35.974Z", "creation_date": "2014-09-14T18:50:32.945Z", "level": 0, "changed_by": "brandon", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Contact Us
3802	247	7	7	16	json	[{"pk": 7, "model": "cms.title", "fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Contact Us", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 7, "published": true, "path": "contact-us", "publisher_state": 1, "creation_date": "2014-09-14T18:50:33.093Z", "slug": "contact-us", "publisher_public": 11}}]	Contact Us (contact-us, en)
3803	247	162	162	10	json	[{"pk": 162, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-09-21T01:42:07.680Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-21T01:41:16.863Z", "lft": 1, "tree_id": 51, "position": 2, "placeholder": 32, "plugin_type": "ContactPlugin"}}]	162
3804	247	85	85	31	json	[{"pk": 85, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><img title=\\"Picture - contact-us-banner.jpg\\" id=\\"plugin_obj_86\\" src=\\"/static/cms/img/icons/plugins/image.png\\" alt=\\"Picture\\"></p>\\n"}}]	
3805	247	86	86	10	json	[{"pk": 86, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-09-14T22:38:31.174Z", "parent": 85, "language": "en", "level": 1, "creation_date": "2014-09-14T22:38:15.230Z", "lft": 2, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "PicturePlugin"}}]	86
3806	247	85	85	10	json	[{"pk": 85, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-09-14T22:38:31.215Z", "parent": null, "language": "en", "level": 0, "creation_date": "2014-09-14T22:38:10.897Z", "lft": 1, "tree_id": 41, "position": 0, "placeholder": 32, "plugin_type": "TextPlugin"}}]	85
3807	248	32	32	9	json	[{"pk": 32, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content
3808	248	33	33	9	json	[{"pk": 33, "model": "cms.placeholder", "fields": {"slot": "base_content", "default_width": null}}]	base_content
\.


--
-- Name: reversion_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('reversion_version_id_seq', 4011, true);


--
-- Data for Name: south_migrationhistory; Type: TABLE DATA; Schema: public; Owner: brandon
--

COPY south_migrationhistory (id, app_name, migration, applied) FROM stdin;
1	cms	0001_initial	2014-09-01 20:13:00.067878-04
2	cms	0002_auto_start	2014-09-01 20:13:00.071221-04
3	cms	0003_remove_placeholder	2014-09-01 20:13:00.073103-04
4	cms	0004_textobjects	2014-09-01 20:13:00.075003-04
5	cms	0005_mptt_added_to_plugins	2014-09-01 20:13:00.077003-04
6	cms	0006_apphook	2014-09-01 20:13:00.079178-04
7	cms	0007_apphook_longer	2014-09-01 20:13:00.081401-04
8	cms	0008_redirects	2014-09-01 20:13:00.083188-04
9	cms	0009_added_meta_fields	2014-09-01 20:13:00.085149-04
10	cms	0010_5char_language	2014-09-01 20:13:00.086929-04
11	cms	0011_title_overwrites	2014-09-01 20:13:00.088823-04
12	cms	0012_publisher	2014-09-01 20:13:00.090555-04
13	cms	0013_site_copy	2014-09-01 20:13:00.092324-04
14	cms	0014_sites_removed	2014-09-01 20:13:00.094211-04
15	cms	0015_modified_by_added	2014-09-01 20:13:00.096015-04
16	cms	0016_author_copy	2014-09-01 20:13:00.098299-04
17	cms	0017_author_removed	2014-09-01 20:13:00.100286-04
18	cms	0018_site_permissions	2014-09-01 20:13:00.102278-04
19	cms	0019_public_table_renames	2014-09-01 20:13:00.104732-04
20	cms	0020_advanced_permissions	2014-09-01 20:13:00.106662-04
21	cms	0021_publisher2	2014-09-01 20:13:00.108566-04
22	cms	0022_login_required_added	2014-09-01 20:13:00.110634-04
23	cms	0023_plugin_table_naming_function_changed	2014-09-01 20:13:00.112552-04
24	cms	0024_added_placeholder_model	2014-09-01 20:13:00.114306-04
25	cms	0025_placeholder_migration	2014-09-01 20:13:00.11609-04
26	cms	0026_finish_placeholder_migration	2014-09-01 20:13:00.12118-04
27	cms	0027_added_width_to_placeholder	2014-09-01 20:13:00.124138-04
28	cms	0028_limit_visibility_in_menu_step1of3	2014-09-01 20:13:00.12632-04
29	cms	0029_limit_visibility_in_menu_step2of3_data	2014-09-01 20:13:00.128763-04
30	cms	0030_limit_visibility_in_menu_step3of3	2014-09-01 20:13:00.130721-04
31	cms	0031_improved_language_code_support	2014-09-01 20:13:00.132625-04
32	cms	0032_auto__del_field_cmsplugin_publisher_public__del_field_cmsplugin_publis	2014-09-01 20:13:00.134423-04
33	cms	0033_auto__del_field_title_publisher_is_draft__del_field_title_publisher_st	2014-09-01 20:13:00.136269-04
34	cms	0034_auto__chg_field_title_language__chg_field_cmsplugin_language__add_fiel	2014-09-01 20:13:00.138411-04
35	cms	0035_auto__add_field_globalpagepermission_can_view__add_field_pagepermissio	2014-09-01 20:13:00.140547-04
36	cms	0036_auto__add_field_cmsplugin_changed_date	2014-09-01 20:13:00.142617-04
37	cms	0037_auto__del_pagemoderator__del_field_globalpagepermission_can_moderate__	2014-09-01 20:13:00.145014-04
38	cms	0038_publish_page_permission	2014-09-01 20:13:00.147285-04
39	cms	0039_auto__del_field_page_moderator_state	2014-09-01 20:13:00.149209-04
40	cms	0040_auto__del_field_title_meta_keywords__chg_field_title_meta_description	2014-09-01 20:13:00.151228-04
41	cms	0041_auto__add_usersettings	2014-09-01 20:13:00.153092-04
42	cms	0042_auto__del_field_title_meta_keywords__chg_field_title_meta_description_	2014-09-01 20:13:00.154999-04
43	cms	0043_auto__add_field_usersettings_clipboard	2014-09-01 20:13:00.156873-04
44	cms	0044_killsettings	2014-09-01 20:13:00.158791-04
45	cms	0045_auto__add_field_page_application_urls	2014-09-01 20:13:00.160693-04
46	cms	0046_move_apphooks	2014-09-01 20:13:00.162665-04
47	cms	0047_auto__del_field_title_application_urls	2014-09-01 20:13:00.164614-04
48	cms	0048_auto__add_field_page_application_namespace__add_unique_page_publisher_	2014-09-01 20:13:00.16654-04
49	cms	0049_auto__add_field_page_is_home	2014-09-01 20:13:00.168357-04
50	cms	0050_save_home	2014-09-01 20:13:00.170174-04
51	cms	0051_auto__add_placeholderreference	2014-09-01 20:13:00.171936-04
52	cms	0051_fix_content_type	2014-09-01 20:13:00.173685-04
53	cms	0052_auto__add_placeholderreference__add_staticplaceholder__add_field_page_	2014-09-01 20:13:00.175564-04
54	cms	0053_auto__add_field_title_published__add_field_title_publisher_is_draft__a	2014-09-01 20:13:00.177367-04
55	cms	0054_new_publisher_data	2014-09-01 20:13:00.179433-04
56	cms	0055_auto__del_field_page_publisher_state__del_field_page_published	2014-09-01 20:13:00.181546-04
57	cms	0056_auto__del_field_page_published_languages	2014-09-01 20:13:00.188725-04
58	cms	0057_fix_values	2014-09-01 20:13:00.191318-04
59	cms	0058_placeholderref_table_rename	2014-09-01 20:13:00.193758-04
60	cms	0059_auto__del_pagemoderatorstate	2014-09-01 20:13:00.195795-04
61	cms	0060_auto__add_field_page_xframe_options	2014-09-01 20:13:00.197637-04
62	cms	0061_revers_id_unique	2014-09-01 20:13:00.1996-04
63	cms	0062_auto__add_field_staticplaceholder_site__del_unique_staticplaceholder_c	2014-09-01 20:13:00.20177-04
64	cms	0063_auto__chg_field_staticplaceholder_site	2014-09-01 20:13:00.203993-04
65	cms	0064_staticplaceholder_site_change	2014-09-01 20:13:00.205822-04
66	cms	0065_auto__add_unique_usersettings_user	2014-09-01 20:13:00.207631-04
67	cms	0066_auto__add_aliaspluginmodel	2014-09-01 20:13:00.20946-04
68	cms	0067_auto__add_field_aliaspluginmodel_alias_placeholder__chg_field_aliasplu	2014-09-01 20:13:00.211269-04
69	cms	0068_auto__chg_field_placeholder_slot	2014-09-01 20:13:00.213238-04
70	cms	0069_static_placeholder_permissions	2014-09-01 20:13:00.215155-04
71	menus	0001_initial	2014-09-01 20:13:00.263306-04
72	djangocms_file	0001_initial	2014-09-01 20:13:00.362007-04
73	djangocms_file	0002_auto__add_field_file_target	2014-09-01 20:13:00.364027-04
74	djangocms_googlemap	0001_initial	2014-09-01 20:13:00.407564-04
75	djangocms_inherit	0001_initial	2014-09-01 20:13:00.464446-04
76	djangocms_picture	0001_initial	2014-09-01 20:13:00.565271-04
77	djangocms_teaser	0001_initial	2014-09-01 20:13:00.614208-04
78	djangocms_video	0001_initial	2014-09-01 20:13:00.70811-04
79	djangocms_link	0001_initial	2014-09-01 20:13:00.75311-04
80	djangocms_link	0002_auto__add_field_link_phone	2014-09-01 20:13:00.75516-04
81	djangocms_link	0003_auto__add_field_link_anchor__chg_field_link_page_link	2014-09-01 20:13:00.757137-04
82	djangocms_snippet	0001_initial	2014-09-01 20:13:00.800785-04
83	djangocms_snippet	0002_rename_missing_tables	2014-09-01 20:13:00.802839-04
84	djangocms_text_ckeditor	0001_initial	2014-09-01 20:13:00.904956-04
85	djangocms_text_ckeditor	0002_rename_plugin	2014-09-01 20:13:00.906948-04
86	reversion	0001_initial	2014-09-01 20:13:00.950479-04
87	reversion	0002_auto__add_field_version_type	2014-09-01 20:13:00.952595-04
88	reversion	0003_auto__add_field_version_object_id_int	2014-09-01 20:13:00.954726-04
89	reversion	0004_populate_object_id_int	2014-09-01 20:13:00.956887-04
90	reversion	0005_auto__add_field_revision_manager_slug	2014-09-01 20:13:00.959098-04
91	reversion	0006_remove_delete_revisions	2014-09-01 20:13:00.961099-04
92	reversion	0007_auto__del_field_version_type	2014-09-01 20:13:00.962949-04
93	cmsplugin_gallery	0001_initial	2014-09-03 21:28:19.584911-04
94	cmsplugin_gallery	0002_auto__add_field_galleryplugin_template	2014-09-03 21:28:19.600364-04
95	cmsplugin_gallery	0003_move_images_to_media_path	2014-09-03 21:28:19.609784-04
96	cmsplugin_gallery	0004_auto__add_field_image_link__add_field_image_extended_content__add_fiel	2014-09-03 21:28:19.643885-04
97	cmsplugin_gallery	0005_auto__add_field_galleryplugin_fade_duration	2014-09-03 21:28:19.659918-04
98	cmsplugin_gallery	0006_auto__chg_field_image_title__chg_field_image_link__chg_field_image_alt	2014-09-03 21:28:19.756841-04
99	easy_thumbnails	0001_initial	2014-09-14 14:58:06.897874-04
100	easy_thumbnails	0002_filename_indexes	2014-09-14 14:58:06.911833-04
101	easy_thumbnails	0003_auto__add_storagenew	2014-09-14 14:58:06.924752-04
102	easy_thumbnails	0004_auto__add_field_source_storage_new__add_field_thumbnail_storage_new	2014-09-14 14:58:06.948128-04
103	easy_thumbnails	0005_storage_fks_null	2014-09-14 14:58:07.038954-04
104	easy_thumbnails	0006_copy_storage	2014-09-14 14:58:07.046734-04
105	easy_thumbnails	0007_storagenew_fks_not_null	2014-09-14 14:58:07.099716-04
106	easy_thumbnails	0008_auto__del_field_source_storage__del_field_thumbnail_storage	2014-09-14 14:58:07.110162-04
107	easy_thumbnails	0009_auto__del_storage	2014-09-14 14:58:07.117113-04
108	easy_thumbnails	0010_rename_storage	2014-09-14 14:58:07.131336-04
109	easy_thumbnails	0011_auto__add_field_source_storage_hash__add_field_thumbnail_storage_hash	2014-09-14 14:58:07.152041-04
110	easy_thumbnails	0012_build_storage_hashes	2014-09-14 14:58:07.162553-04
111	easy_thumbnails	0013_auto__del_storage__del_field_source_storage__del_field_thumbnail_stora	2014-09-14 14:58:07.171552-04
112	easy_thumbnails	0014_auto__add_unique_source_name_storage_hash__add_unique_thumbnail_name_s	2014-09-14 14:58:07.18101-04
113	easy_thumbnails	0015_auto__del_unique_thumbnail_name_storage_hash__add_unique_thumbnail_sou	2014-09-14 14:58:07.200456-04
114	easy_thumbnails	0016_auto__add_thumbnaildimensions	2014-09-14 14:58:07.215945-04
115	reversion	0008_auto__add_index_revision_date_created	2014-09-14 14:58:08.54393-04
124	cmsplugin_contact	0001_initial	2014-09-14 16:08:47.834695-04
125	cmsplugin_contact	0002_auto__chg_field_contact_thanks	2014-09-14 16:08:47.90384-04
126	cmsplugin_contact	0003_auto__add_field_contact_form_name	2014-09-14 16:08:47.926115-04
127	cmsplugin_contact	0004_add_field_Contact_form_layout	2014-09-14 16:08:47.961327-04
128	cmsplugin_contact	0005_auto__del_field_contact_content_label__del_field_contact_subject_label	2014-09-14 16:08:47.977281-04
129	cmsplugin_contact	0006_fix_table_names	2014-09-14 16:08:48.085015-04
130	cmsplugin_contact	0007_add_url_field	2014-09-14 16:08:48.106104-04
134	cmsplugin_file_gallery	0001_initial	2014-09-14 18:31:58.44629-04
135	cmsplugin_file_gallery	0002_auto__chg_field_downloadablefile_src	2014-09-14 18:31:58.452324-04
136	cmsplugin_file_gallery	0003_auto__chg_field_downloadablefile_downloadable_file	2014-09-14 18:31:58.454342-04
137	cmsplugin_file_gallery	0004_auto__add_field_downloadablefile_author__add_field_downloadablefile_su	2014-09-14 18:31:58.456208-04
138	cmsplugin_file_gallery	0005_auto__chg_field_downloadablefile_author__chg_field_downloadablefile_ti	2014-09-14 18:31:58.458347-04
139	product_finder	0001_initial	2014-09-14 19:59:28.447413-04
140	product_finder	0002_auto__add_field_productcategory_img	2014-09-14 20:02:43.470226-04
141	product_finder	0003_auto__add_field_productcategory_ordering	2014-09-14 20:28:24.30277-04
\.


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brandon
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 142, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: cms_aliaspluginmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cms_aliaspluginmodel
    ADD CONSTRAINT cms_aliaspluginmodel_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cms_cmsplugin_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cms_cmsplugin
    ADD CONSTRAINT cms_cmsplugin_pkey PRIMARY KEY (id);


--
-- Name: cms_globalpagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cms_globalpagepermission
    ADD CONSTRAINT cms_globalpagepermission_pkey PRIMARY KEY (id);


--
-- Name: cms_globalpagepermission_site_globalpagepermission_id_site__key; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT cms_globalpagepermission_site_globalpagepermission_id_site__key UNIQUE (globalpagepermission_id, site_id);


--
-- Name: cms_globalpagepermission_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT cms_globalpagepermission_sites_pkey PRIMARY KEY (id);


--
-- Name: cms_page_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_pkey PRIMARY KEY (id);


--
-- Name: cms_page_placeholders_page_id_placeholder_id_key; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT cms_page_placeholders_page_id_placeholder_id_key UNIQUE (page_id, placeholder_id);


--
-- Name: cms_page_placeholders_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT cms_page_placeholders_pkey PRIMARY KEY (id);


--
-- Name: cms_page_publisher_is_draft_application_namespace_key; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_publisher_is_draft_application_namespace_key UNIQUE (publisher_is_draft, application_namespace);


--
-- Name: cms_page_publisher_public_id_key; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_publisher_public_id_key UNIQUE (publisher_public_id);


--
-- Name: cms_page_reverse_id_site_id_publisher_is_draft_key; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_reverse_id_site_id_publisher_is_draft_key UNIQUE (reverse_id, site_id, publisher_is_draft);


--
-- Name: cms_pagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT cms_pagepermission_pkey PRIMARY KEY (id);


--
-- Name: cms_pageuser_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cms_pageuser
    ADD CONSTRAINT cms_pageuser_pkey PRIMARY KEY (user_ptr_id);


--
-- Name: cms_pageusergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cms_pageusergroup
    ADD CONSTRAINT cms_pageusergroup_pkey PRIMARY KEY (group_ptr_id);


--
-- Name: cms_placeholder_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cms_placeholder
    ADD CONSTRAINT cms_placeholder_pkey PRIMARY KEY (id);


--
-- Name: cms_placeholderreference_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cms_placeholderreference
    ADD CONSTRAINT cms_placeholderreference_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cms_staticplaceholder_code_site_id_key; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cms_staticplaceholder
    ADD CONSTRAINT cms_staticplaceholder_code_site_id_key UNIQUE (code, site_id);


--
-- Name: cms_staticplaceholder_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cms_staticplaceholder
    ADD CONSTRAINT cms_staticplaceholder_pkey PRIMARY KEY (id);


--
-- Name: cms_title_language_page_id_key; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT cms_title_language_page_id_key UNIQUE (language, page_id);


--
-- Name: cms_title_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT cms_title_pkey PRIMARY KEY (id);


--
-- Name: cms_title_publisher_public_id_key; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT cms_title_publisher_public_id_key UNIQUE (publisher_public_id);


--
-- Name: cms_usersettings_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cms_usersettings
    ADD CONSTRAINT cms_usersettings_pkey PRIMARY KEY (id);


--
-- Name: cms_usersettings_user_id_key; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cms_usersettings
    ADD CONSTRAINT cms_usersettings_user_id_key UNIQUE (user_id);


--
-- Name: cmsplugin_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_contact_contact
    ADD CONSTRAINT cmsplugin_contact_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_file_gallery_downloadablefile_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_file_gallery_downloadablefile
    ADD CONSTRAINT cmsplugin_file_gallery_downloadablefile_pkey PRIMARY KEY (id);


--
-- Name: cmsplugin_file_gallery_filegalleryplugin_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_file_gallery_filegalleryplugin
    ADD CONSTRAINT cmsplugin_file_gallery_filegalleryplugin_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_gallery_galleryplugin_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_gallery_galleryplugin
    ADD CONSTRAINT cmsplugin_gallery_galleryplugin_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_gallery_image_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_gallery_image
    ADD CONSTRAINT cmsplugin_gallery_image_pkey PRIMARY KEY (id);


--
-- Name: cmsplugin_galleryplugin_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_galleryplugin
    ADD CONSTRAINT cmsplugin_galleryplugin_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_image_gallery_galleryimage_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_image_gallery_galleryimage
    ADD CONSTRAINT cmsplugin_image_gallery_galleryimage_pkey PRIMARY KEY (id);


--
-- Name: cmsplugin_image_gallery_imagegalleryplugin_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_image_gallery_imagegalleryplugin
    ADD CONSTRAINT cmsplugin_image_gallery_imagegalleryplugin_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_search_searchpluginconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_search_searchpluginconfig
    ADD CONSTRAINT cmsplugin_search_searchpluginconfig_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: djangocms_file_file_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY djangocms_file_file
    ADD CONSTRAINT djangocms_file_file_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: djangocms_googlemap_googlemap_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY djangocms_googlemap_googlemap
    ADD CONSTRAINT djangocms_googlemap_googlemap_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: djangocms_inherit_inheritpageplaceholder_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY djangocms_inherit_inheritpageplaceholder
    ADD CONSTRAINT djangocms_inherit_inheritpageplaceholder_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: djangocms_link_link_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY djangocms_link_link
    ADD CONSTRAINT djangocms_link_link_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: djangocms_picture_picture_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY djangocms_picture_picture
    ADD CONSTRAINT djangocms_picture_picture_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: djangocms_snippet_snippet_name_key; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY djangocms_snippet_snippet
    ADD CONSTRAINT djangocms_snippet_snippet_name_key UNIQUE (name);


--
-- Name: djangocms_snippet_snippet_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY djangocms_snippet_snippet
    ADD CONSTRAINT djangocms_snippet_snippet_pkey PRIMARY KEY (id);


--
-- Name: djangocms_snippet_snippetptr_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY djangocms_snippet_snippetptr
    ADD CONSTRAINT djangocms_snippet_snippetptr_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: djangocms_teaser_teaser_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY djangocms_teaser_teaser
    ADD CONSTRAINT djangocms_teaser_teaser_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: djangocms_text_ckeditor_text_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY djangocms_text_ckeditor_text
    ADD CONSTRAINT djangocms_text_ckeditor_text_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: djangocms_video_video_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY djangocms_video_video
    ADD CONSTRAINT djangocms_video_video_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: easy_thumbnails_source_name_7549c98cc6dd6969_uniq; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_name_7549c98cc6dd6969_uniq UNIQUE (name, storage_hash);


--
-- Name: easy_thumbnails_source_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnail_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnail_source_id_1f50d53db8191480_uniq; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_source_id_1f50d53db8191480_uniq UNIQUE (source_id, name, storage_hash);


--
-- Name: easy_thumbnails_thumbnaildimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnaildimensions_thumbnail_id_key; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_thumbnail_id_key UNIQUE (thumbnail_id);


--
-- Name: menus_cachekey_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY menus_cachekey
    ADD CONSTRAINT menus_cachekey_pkey PRIMARY KEY (id);


--
-- Name: product_finder_product_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY product_finder_product
    ADD CONSTRAINT product_finder_product_pkey PRIMARY KEY (id);


--
-- Name: product_finder_product_slug_key; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY product_finder_product
    ADD CONSTRAINT product_finder_product_slug_key UNIQUE (slug);


--
-- Name: product_finder_productcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY product_finder_productcategory
    ADD CONSTRAINT product_finder_productcategory_pkey PRIMARY KEY (id);


--
-- Name: product_finder_productcategory_slug_key; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY product_finder_productcategory
    ADD CONSTRAINT product_finder_productcategory_slug_key UNIQUE (slug);


--
-- Name: reversion_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY reversion_revision
    ADD CONSTRAINT reversion_revision_pkey PRIMARY KEY (id);


--
-- Name: reversion_version_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY reversion_version
    ADD CONSTRAINT reversion_version_pkey PRIMARY KEY (id);


--
-- Name: south_migrationhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: brandon; Tablespace: 
--

ALTER TABLE ONLY south_migrationhistory
    ADD CONSTRAINT south_migrationhistory_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX auth_group_name_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_like; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX auth_user_username_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: cms_aliaspluginmodel_alias_placeholder_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_aliaspluginmodel_alias_placeholder_id ON cms_aliaspluginmodel USING btree (alias_placeholder_id);


--
-- Name: cms_aliaspluginmodel_plugin_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_aliaspluginmodel_plugin_id ON cms_aliaspluginmodel USING btree (plugin_id);


--
-- Name: cms_cmsplugin_language; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_cmsplugin_language ON cms_cmsplugin USING btree (language);


--
-- Name: cms_cmsplugin_language_like; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_cmsplugin_language_like ON cms_cmsplugin USING btree (language varchar_pattern_ops);


--
-- Name: cms_cmsplugin_level; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_cmsplugin_level ON cms_cmsplugin USING btree (level);


--
-- Name: cms_cmsplugin_lft; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_cmsplugin_lft ON cms_cmsplugin USING btree (lft);


--
-- Name: cms_cmsplugin_parent_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_cmsplugin_parent_id ON cms_cmsplugin USING btree (parent_id);


--
-- Name: cms_cmsplugin_placeholder_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_cmsplugin_placeholder_id ON cms_cmsplugin USING btree (placeholder_id);


--
-- Name: cms_cmsplugin_plugin_type; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_cmsplugin_plugin_type ON cms_cmsplugin USING btree (plugin_type);


--
-- Name: cms_cmsplugin_plugin_type_like; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_cmsplugin_plugin_type_like ON cms_cmsplugin USING btree (plugin_type varchar_pattern_ops);


--
-- Name: cms_cmsplugin_rght; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_cmsplugin_rght ON cms_cmsplugin USING btree (rght);


--
-- Name: cms_cmsplugin_tree_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_cmsplugin_tree_id ON cms_cmsplugin USING btree (tree_id);


--
-- Name: cms_globalpagepermission_group_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_group_id ON cms_globalpagepermission USING btree (group_id);


--
-- Name: cms_globalpagepermission_sites_globalpagepermission_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_sites_globalpagepermission_id ON cms_globalpagepermission_sites USING btree (globalpagepermission_id);


--
-- Name: cms_globalpagepermission_sites_site_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_sites_site_id ON cms_globalpagepermission_sites USING btree (site_id);


--
-- Name: cms_globalpagepermission_user_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_user_id ON cms_globalpagepermission USING btree (user_id);


--
-- Name: cms_page_application_urls; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_page_application_urls ON cms_page USING btree (application_urls);


--
-- Name: cms_page_application_urls_like; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_page_application_urls_like ON cms_page USING btree (application_urls varchar_pattern_ops);


--
-- Name: cms_page_in_navigation; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_page_in_navigation ON cms_page USING btree (in_navigation);


--
-- Name: cms_page_is_home; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_page_is_home ON cms_page USING btree (is_home);


--
-- Name: cms_page_level; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_page_level ON cms_page USING btree (level);


--
-- Name: cms_page_lft; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_page_lft ON cms_page USING btree (lft);


--
-- Name: cms_page_limit_visibility_in_menu; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_page_limit_visibility_in_menu ON cms_page USING btree (limit_visibility_in_menu);


--
-- Name: cms_page_navigation_extenders; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_page_navigation_extenders ON cms_page USING btree (navigation_extenders);


--
-- Name: cms_page_navigation_extenders_like; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_page_navigation_extenders_like ON cms_page USING btree (navigation_extenders varchar_pattern_ops);


--
-- Name: cms_page_parent_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_page_parent_id ON cms_page USING btree (parent_id);


--
-- Name: cms_page_placeholders_page_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_page_placeholders_page_id ON cms_page_placeholders USING btree (page_id);


--
-- Name: cms_page_placeholders_placeholder_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_page_placeholders_placeholder_id ON cms_page_placeholders USING btree (placeholder_id);


--
-- Name: cms_page_publication_date; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_page_publication_date ON cms_page USING btree (publication_date);


--
-- Name: cms_page_publication_end_date; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_page_publication_end_date ON cms_page USING btree (publication_end_date);


--
-- Name: cms_page_publisher_is_draft; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_page_publisher_is_draft ON cms_page USING btree (publisher_is_draft);


--
-- Name: cms_page_reverse_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_page_reverse_id ON cms_page USING btree (reverse_id);


--
-- Name: cms_page_reverse_id_like; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_page_reverse_id_like ON cms_page USING btree (reverse_id varchar_pattern_ops);


--
-- Name: cms_page_rght; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_page_rght ON cms_page USING btree (rght);


--
-- Name: cms_page_site_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_page_site_id ON cms_page USING btree (site_id);


--
-- Name: cms_page_soft_root; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_page_soft_root ON cms_page USING btree (soft_root);


--
-- Name: cms_page_tree_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_page_tree_id ON cms_page USING btree (tree_id);


--
-- Name: cms_pagepermission_group_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_pagepermission_group_id ON cms_pagepermission USING btree (group_id);


--
-- Name: cms_pagepermission_page_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_pagepermission_page_id ON cms_pagepermission USING btree (page_id);


--
-- Name: cms_pagepermission_user_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_pagepermission_user_id ON cms_pagepermission USING btree (user_id);


--
-- Name: cms_pageuser_created_by_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_pageuser_created_by_id ON cms_pageuser USING btree (created_by_id);


--
-- Name: cms_pageusergroup_created_by_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_pageusergroup_created_by_id ON cms_pageusergroup USING btree (created_by_id);


--
-- Name: cms_placeholder_slot; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_placeholder_slot ON cms_placeholder USING btree (slot);


--
-- Name: cms_placeholder_slot_like; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_placeholder_slot_like ON cms_placeholder USING btree (slot varchar_pattern_ops);


--
-- Name: cms_placeholderreference_placeholder_ref_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_placeholderreference_placeholder_ref_id ON cms_placeholderreference USING btree (placeholder_ref_id);


--
-- Name: cms_staticplaceholder_draft_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_staticplaceholder_draft_id ON cms_staticplaceholder USING btree (draft_id);


--
-- Name: cms_staticplaceholder_public_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_staticplaceholder_public_id ON cms_staticplaceholder USING btree (public_id);


--
-- Name: cms_staticplaceholder_site_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_staticplaceholder_site_id ON cms_staticplaceholder USING btree (site_id);


--
-- Name: cms_title_has_url_overwrite; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_title_has_url_overwrite ON cms_title USING btree (has_url_overwrite);


--
-- Name: cms_title_language; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_title_language ON cms_title USING btree (language);


--
-- Name: cms_title_language_like; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_title_language_like ON cms_title USING btree (language varchar_pattern_ops);


--
-- Name: cms_title_page_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_title_page_id ON cms_title USING btree (page_id);


--
-- Name: cms_title_path; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_title_path ON cms_title USING btree (path);


--
-- Name: cms_title_path_like; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_title_path_like ON cms_title USING btree (path varchar_pattern_ops);


--
-- Name: cms_title_publisher_is_draft; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_title_publisher_is_draft ON cms_title USING btree (publisher_is_draft);


--
-- Name: cms_title_publisher_state; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_title_publisher_state ON cms_title USING btree (publisher_state);


--
-- Name: cms_title_slug; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_title_slug ON cms_title USING btree (slug);


--
-- Name: cms_title_slug_like; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_title_slug_like ON cms_title USING btree (slug varchar_pattern_ops);


--
-- Name: cms_usersettings_clipboard_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cms_usersettings_clipboard_id ON cms_usersettings USING btree (clipboard_id);


--
-- Name: cmsplugin_file_gallery_downloadablefile_gallery_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cmsplugin_file_gallery_downloadablefile_gallery_id ON cmsplugin_file_gallery_downloadablefile USING btree (gallery_id);


--
-- Name: cmsplugin_gallery_image_gallery_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cmsplugin_gallery_image_gallery_id ON cmsplugin_gallery_image USING btree (gallery_id);


--
-- Name: cmsplugin_image_gallery_galleryimage_gallery_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX cmsplugin_image_gallery_galleryimage_gallery_id ON cmsplugin_image_gallery_galleryimage USING btree (gallery_id);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX django_session_session_key_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: djangocms_inherit_inheritpageplaceholder_from_page_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX djangocms_inherit_inheritpageplaceholder_from_page_id ON djangocms_inherit_inheritpageplaceholder USING btree (from_page_id);


--
-- Name: djangocms_link_link_page_link_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX djangocms_link_link_page_link_id ON djangocms_link_link USING btree (page_link_id);


--
-- Name: djangocms_picture_picture_page_link_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX djangocms_picture_picture_page_link_id ON djangocms_picture_picture USING btree (page_link_id);


--
-- Name: djangocms_snippet_snippet_name_like; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX djangocms_snippet_snippet_name_like ON djangocms_snippet_snippet USING btree (name varchar_pattern_ops);


--
-- Name: djangocms_snippet_snippetptr_snippet_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX djangocms_snippet_snippetptr_snippet_id ON djangocms_snippet_snippetptr USING btree (snippet_id);


--
-- Name: djangocms_teaser_teaser_page_link_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX djangocms_teaser_teaser_page_link_id ON djangocms_teaser_teaser USING btree (page_link_id);


--
-- Name: easy_thumbnails_source_name; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_name ON easy_thumbnails_source USING btree (name);


--
-- Name: easy_thumbnails_source_storage_hash; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_storage_hash ON easy_thumbnails_source USING btree (storage_hash);


--
-- Name: easy_thumbnails_thumbnail_name; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_name ON easy_thumbnails_thumbnail USING btree (name);


--
-- Name: easy_thumbnails_thumbnail_source_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_source_id ON easy_thumbnails_thumbnail USING btree (source_id);


--
-- Name: easy_thumbnails_thumbnail_storage_hash; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_storage_hash ON easy_thumbnails_thumbnail USING btree (storage_hash);


--
-- Name: product_finder_product_category_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX product_finder_product_category_id ON product_finder_product USING btree (category_id);


--
-- Name: product_finder_product_slug_like; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX product_finder_product_slug_like ON product_finder_product USING btree (slug varchar_pattern_ops);


--
-- Name: product_finder_productcategory_slug_like; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX product_finder_productcategory_slug_like ON product_finder_productcategory USING btree (slug varchar_pattern_ops);


--
-- Name: reversion_revision_date_created; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX reversion_revision_date_created ON reversion_revision USING btree (date_created);


--
-- Name: reversion_revision_manager_slug; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX reversion_revision_manager_slug ON reversion_revision USING btree (manager_slug);


--
-- Name: reversion_revision_manager_slug_like; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX reversion_revision_manager_slug_like ON reversion_revision USING btree (manager_slug varchar_pattern_ops);


--
-- Name: reversion_revision_user_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX reversion_revision_user_id ON reversion_revision USING btree (user_id);


--
-- Name: reversion_version_content_type_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX reversion_version_content_type_id ON reversion_version USING btree (content_type_id);


--
-- Name: reversion_version_object_id_int; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX reversion_version_object_id_int ON reversion_version USING btree (object_id_int);


--
-- Name: reversion_version_revision_id; Type: INDEX; Schema: public; Owner: brandon; Tablespace: 
--

CREATE INDEX reversion_version_revision_id ON reversion_version USING btree (revision_id);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: clipboard_id_refs_id_29248006; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_usersettings
    ADD CONSTRAINT clipboard_id_refs_id_29248006 FOREIGN KEY (clipboard_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_aliaspluginmodel_alias_placeholder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_aliaspluginmodel
    ADD CONSTRAINT cms_aliaspluginmodel_alias_placeholder_id_fkey FOREIGN KEY (alias_placeholder_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_cmsplugin_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_cmsplugin
    ADD CONSTRAINT cms_cmsplugin_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_cmsplugin_placeholder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_cmsplugin
    ADD CONSTRAINT cms_cmsplugin_placeholder_id_fkey FOREIGN KEY (placeholder_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_globalpagepermission_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_globalpagepermission
    ADD CONSTRAINT cms_globalpagepermission_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_globalpagepermission_sites_site_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT cms_globalpagepermission_sites_site_id_fkey FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_globalpagepermission_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_globalpagepermission
    ADD CONSTRAINT cms_globalpagepermission_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_page_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_page_placeholders_placeholder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT cms_page_placeholders_placeholder_id_fkey FOREIGN KEY (placeholder_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_page_publisher_public_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_publisher_public_id_fkey FOREIGN KEY (publisher_public_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_page_site_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_site_id_fkey FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pagepermission_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT cms_pagepermission_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pagepermission_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT cms_pagepermission_page_id_fkey FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pagepermission_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT cms_pagepermission_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pageuser_created_by_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_pageuser
    ADD CONSTRAINT cms_pageuser_created_by_id_fkey FOREIGN KEY (created_by_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pageuser_user_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_pageuser
    ADD CONSTRAINT cms_pageuser_user_ptr_id_fkey FOREIGN KEY (user_ptr_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pageusergroup_created_by_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_pageusergroup
    ADD CONSTRAINT cms_pageusergroup_created_by_id_fkey FOREIGN KEY (created_by_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pageusergroup_group_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_pageusergroup
    ADD CONSTRAINT cms_pageusergroup_group_ptr_id_fkey FOREIGN KEY (group_ptr_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_placeholderreference_placeholder_ref_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_placeholderreference
    ADD CONSTRAINT cms_placeholderreference_placeholder_ref_id_fkey FOREIGN KEY (placeholder_ref_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_staticplaceholder_draft_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_staticplaceholder
    ADD CONSTRAINT cms_staticplaceholder_draft_id_fkey FOREIGN KEY (draft_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_staticplaceholder_public_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_staticplaceholder
    ADD CONSTRAINT cms_staticplaceholder_public_id_fkey FOREIGN KEY (public_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_staticplaceholder_site_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_staticplaceholder
    ADD CONSTRAINT cms_staticplaceholder_site_id_fkey FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_title_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT cms_title_page_id_fkey FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_title_publisher_public_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT cms_title_publisher_public_id_fkey FOREIGN KEY (publisher_public_id) REFERENCES cms_title(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_usersettings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_usersettings
    ADD CONSTRAINT cms_usersettings_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_file_gallery_downloadablefile_gallery_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cmsplugin_file_gallery_downloadablefile
    ADD CONSTRAINT cmsplugin_file_gallery_downloadablefile_gallery_id_fkey FOREIGN KEY (gallery_id) REFERENCES cmsplugin_file_gallery_filegalleryplugin(cmsplugin_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_file_gallery_filegalleryplugin_cmsplugin_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cmsplugin_file_gallery_filegalleryplugin
    ADD CONSTRAINT cmsplugin_file_gallery_filegalleryplugin_cmsplugin_ptr_id_fkey FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_gallery_galleryplugin_cmsplugin_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cmsplugin_gallery_galleryplugin
    ADD CONSTRAINT cmsplugin_gallery_galleryplugin_cmsplugin_ptr_id_fkey FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_image_gallery_galleryimage_gallery_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cmsplugin_image_gallery_galleryimage
    ADD CONSTRAINT cmsplugin_image_gallery_galleryimage_gallery_id_fkey FOREIGN KEY (gallery_id) REFERENCES cmsplugin_image_gallery_imagegalleryplugin(cmsplugin_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_image_gallery_imagegalleryplugi_cmsplugin_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cmsplugin_image_gallery_imagegalleryplugin
    ADD CONSTRAINT cmsplugin_image_gallery_imagegalleryplugi_cmsplugin_ptr_id_fkey FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_d6b82c62; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cmsplugin_contact_contact
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_d6b82c62 FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_search_searchpluginconfig_cmsplugin_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cmsplugin_search_searchpluginconfig
    ADD CONSTRAINT cmsplugin_search_searchpluginconfig_cmsplugin_ptr_id_fkey FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_93d2d1f8; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT content_type_id_refs_id_93d2d1f8 FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_d043b34a; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_d043b34a FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djangocms_inherit_inheritpageplaceholder_from_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY djangocms_inherit_inheritpageplaceholder
    ADD CONSTRAINT djangocms_inherit_inheritpageplaceholder_from_page_id_fkey FOREIGN KEY (from_page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djangocms_link_link_page_link_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY djangocms_link_link
    ADD CONSTRAINT djangocms_link_link_page_link_id_fkey FOREIGN KEY (page_link_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djangocms_picture_picture_page_link_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY djangocms_picture_picture
    ADD CONSTRAINT djangocms_picture_picture_page_link_id_fkey FOREIGN KEY (page_link_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djangocms_snippet_snippetptr_snippet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY djangocms_snippet_snippetptr
    ADD CONSTRAINT djangocms_snippet_snippetptr_snippet_id_fkey FOREIGN KEY (snippet_id) REFERENCES djangocms_snippet_snippet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djangocms_teaser_teaser_page_link_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY djangocms_teaser_teaser
    ADD CONSTRAINT djangocms_teaser_teaser_page_link_id_fkey FOREIGN KEY (page_link_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gallery_id_refs_cmsplugin_ptr_id_4e38e397; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cmsplugin_gallery_image
    ADD CONSTRAINT gallery_id_refs_cmsplugin_ptr_id_4e38e397 FOREIGN KEY (gallery_id) REFERENCES cmsplugin_galleryplugin(cmsplugin_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: globalpagepermission_id_refs_id_09b826f9; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT globalpagepermission_id_refs_id_09b826f9 FOREIGN KEY (globalpagepermission_id) REFERENCES cms_globalpagepermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_id_refs_id_88abf373; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT page_id_refs_id_88abf373 FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_finder_product_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY product_finder_product
    ADD CONSTRAINT product_finder_product_category_id_fkey FOREIGN KEY (category_id) REFERENCES product_finder_productcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reversion_revision_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY reversion_revision
    ADD CONSTRAINT reversion_revision_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reversion_version_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY reversion_version
    ADD CONSTRAINT reversion_version_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reversion_version_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY reversion_version
    ADD CONSTRAINT reversion_version_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES reversion_revision(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: source_id_refs_id_0df57a91; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT source_id_refs_id_0df57a91 FOREIGN KEY (source_id) REFERENCES easy_thumbnails_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: thumbnail_id_refs_id_ef901436; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT thumbnail_id_refs_id_ef901436 FOREIGN KEY (thumbnail_id) REFERENCES easy_thumbnails_thumbnail(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_40c41112; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_40c41112 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_4dc23c39; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_4dc23c39 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_c0d12874; Type: FK CONSTRAINT; Schema: public; Owner: brandon
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT user_id_refs_id_c0d12874 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: brandon
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM brandon;
GRANT ALL ON SCHEMA public TO brandon;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

