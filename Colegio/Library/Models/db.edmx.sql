
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/17/2016 10:35:43
-- Generated from EDMX file: C:\Users\greiman_garcia\Documents\Visual Studio 2015\Projects\colegio\Colegio\Library\Models\db.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [colegiodb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_UsuarioRole_Usuario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UsuarioRole] DROP CONSTRAINT [FK_UsuarioRole_Usuario];
GO
IF OBJECT_ID(N'[dbo].[FK_UsuarioRole_Role]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UsuarioRole] DROP CONSTRAINT [FK_UsuarioRole_Role];
GO
IF OBJECT_ID(N'[dbo].[FK_UsuarioTipoUsuario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [FK_UsuarioTipoUsuario];
GO
IF OBJECT_ID(N'[dbo].[FK_UsuarioSeguridad_Estatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [FK_UsuarioSeguridad_Estatus];
GO
IF OBJECT_ID(N'[dbo].[FK_RolePermiso_Role]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RolePermiso] DROP CONSTRAINT [FK_RolePermiso_Role];
GO
IF OBJECT_ID(N'[dbo].[FK_RolePermiso_Permiso]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RolePermiso] DROP CONSTRAINT [FK_RolePermiso_Permiso];
GO
IF OBJECT_ID(N'[dbo].[FK_SeccionPermiso]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Permisos] DROP CONSTRAINT [FK_SeccionPermiso];
GO
IF OBJECT_ID(N'[dbo].[FK_EstudianteUsuario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Estudiantes] DROP CONSTRAINT [FK_EstudianteUsuario];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Usuarios]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Usuarios];
GO
IF OBJECT_ID(N'[dbo].[Roles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Roles];
GO
IF OBJECT_ID(N'[dbo].[Permisos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Permisos];
GO
IF OBJECT_ID(N'[dbo].[TipoUsuarios]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TipoUsuarios];
GO
IF OBJECT_ID(N'[dbo].[Secciones]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Secciones];
GO
IF OBJECT_ID(N'[dbo].[Seguridad_Estatus]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Seguridad_Estatus];
GO
IF OBJECT_ID(N'[dbo].[Estudiantes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Estudiantes];
GO
IF OBJECT_ID(N'[dbo].[UsuarioRole]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UsuarioRole];
GO
IF OBJECT_ID(N'[dbo].[RolePermiso]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RolePermiso];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Usuarios'
CREATE TABLE [dbo].[Usuarios] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Apellido] nvarchar(max)  NOT NULL,
    [Cedula] nvarchar(max)  NULL,
    [RNC] nvarchar(max)  NULL,
    [Tipo] int  NOT NULL,
    [Estatus] int  NOT NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NULL,
    [Activo] bit  NOT NULL
);
GO

-- Creating table 'Permisos'
CREATE TABLE [dbo].[Permisos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Url] nvarchar(max)  NOT NULL,
    [SeccionId] int  NOT NULL
);
GO

-- Creating table 'TipoUsuarios'
CREATE TABLE [dbo].[TipoUsuarios] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Descripcion] nvarchar(max)  NULL
);
GO

-- Creating table 'Secciones'
CREATE TABLE [dbo].[Secciones] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Orden] int  NOT NULL
);
GO

-- Creating table 'Seguridad_Estatus'
CREATE TABLE [dbo].[Seguridad_Estatus] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Descripcion] nvarchar(max)  NULL
);
GO

-- Creating table 'Estudiantes'
CREATE TABLE [dbo].[Estudiantes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Nombres] nvarchar(max)  NOT NULL,
    [Apellido] nvarchar(max)  NOT NULL,
    [Telefono] nvarchar(max)  NULL,
    [Celular] nvarchar(max)  NULL,
    [Fecha_ingreso] datetime  NOT NULL,
    [Status] bit  NOT NULL,
    [Ult_Fecha_act] datetime  NOT NULL,
    [Usuario_Id] int  NOT NULL
);
GO

-- Creating table 'UsuarioRole'
CREATE TABLE [dbo].[UsuarioRole] (
    [Usuarios_Id] int  NOT NULL,
    [Roles_Id] int  NOT NULL
);
GO

-- Creating table 'RolePermiso'
CREATE TABLE [dbo].[RolePermiso] (
    [Roles_Id] int  NOT NULL,
    [Permisos_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Usuarios'
ALTER TABLE [dbo].[Usuarios]
ADD CONSTRAINT [PK_Usuarios]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Permisos'
ALTER TABLE [dbo].[Permisos]
ADD CONSTRAINT [PK_Permisos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TipoUsuarios'
ALTER TABLE [dbo].[TipoUsuarios]
ADD CONSTRAINT [PK_TipoUsuarios]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Secciones'
ALTER TABLE [dbo].[Secciones]
ADD CONSTRAINT [PK_Secciones]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Seguridad_Estatus'
ALTER TABLE [dbo].[Seguridad_Estatus]
ADD CONSTRAINT [PK_Seguridad_Estatus]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Estudiantes'
ALTER TABLE [dbo].[Estudiantes]
ADD CONSTRAINT [PK_Estudiantes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Usuarios_Id], [Roles_Id] in table 'UsuarioRole'
ALTER TABLE [dbo].[UsuarioRole]
ADD CONSTRAINT [PK_UsuarioRole]
    PRIMARY KEY CLUSTERED ([Usuarios_Id], [Roles_Id] ASC);
GO

-- Creating primary key on [Roles_Id], [Permisos_Id] in table 'RolePermiso'
ALTER TABLE [dbo].[RolePermiso]
ADD CONSTRAINT [PK_RolePermiso]
    PRIMARY KEY CLUSTERED ([Roles_Id], [Permisos_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Usuarios_Id] in table 'UsuarioRole'
ALTER TABLE [dbo].[UsuarioRole]
ADD CONSTRAINT [FK_UsuarioRole_Usuario]
    FOREIGN KEY ([Usuarios_Id])
    REFERENCES [dbo].[Usuarios]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Roles_Id] in table 'UsuarioRole'
ALTER TABLE [dbo].[UsuarioRole]
ADD CONSTRAINT [FK_UsuarioRole_Role]
    FOREIGN KEY ([Roles_Id])
    REFERENCES [dbo].[Roles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioRole_Role'
CREATE INDEX [IX_FK_UsuarioRole_Role]
ON [dbo].[UsuarioRole]
    ([Roles_Id]);
GO

-- Creating foreign key on [Tipo] in table 'Usuarios'
ALTER TABLE [dbo].[Usuarios]
ADD CONSTRAINT [FK_UsuarioTipoUsuario]
    FOREIGN KEY ([Tipo])
    REFERENCES [dbo].[TipoUsuarios]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioTipoUsuario'
CREATE INDEX [IX_FK_UsuarioTipoUsuario]
ON [dbo].[Usuarios]
    ([Tipo]);
GO

-- Creating foreign key on [Estatus] in table 'Usuarios'
ALTER TABLE [dbo].[Usuarios]
ADD CONSTRAINT [FK_UsuarioSeguridad_Estatus]
    FOREIGN KEY ([Estatus])
    REFERENCES [dbo].[Seguridad_Estatus]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioSeguridad_Estatus'
CREATE INDEX [IX_FK_UsuarioSeguridad_Estatus]
ON [dbo].[Usuarios]
    ([Estatus]);
GO

-- Creating foreign key on [Roles_Id] in table 'RolePermiso'
ALTER TABLE [dbo].[RolePermiso]
ADD CONSTRAINT [FK_RolePermiso_Role]
    FOREIGN KEY ([Roles_Id])
    REFERENCES [dbo].[Roles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Permisos_Id] in table 'RolePermiso'
ALTER TABLE [dbo].[RolePermiso]
ADD CONSTRAINT [FK_RolePermiso_Permiso]
    FOREIGN KEY ([Permisos_Id])
    REFERENCES [dbo].[Permisos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RolePermiso_Permiso'
CREATE INDEX [IX_FK_RolePermiso_Permiso]
ON [dbo].[RolePermiso]
    ([Permisos_Id]);
GO

-- Creating foreign key on [SeccionId] in table 'Permisos'
ALTER TABLE [dbo].[Permisos]
ADD CONSTRAINT [FK_SeccionPermiso]
    FOREIGN KEY ([SeccionId])
    REFERENCES [dbo].[Secciones]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SeccionPermiso'
CREATE INDEX [IX_FK_SeccionPermiso]
ON [dbo].[Permisos]
    ([SeccionId]);
GO

-- Creating foreign key on [Usuario_Id] in table 'Estudiantes'
ALTER TABLE [dbo].[Estudiantes]
ADD CONSTRAINT [FK_EstudianteUsuario]
    FOREIGN KEY ([Usuario_Id])
    REFERENCES [dbo].[Usuarios]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EstudianteUsuario'
CREATE INDEX [IX_FK_EstudianteUsuario]
ON [dbo].[Estudiantes]
    ([Usuario_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------