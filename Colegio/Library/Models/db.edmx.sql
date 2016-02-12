
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/12/2016 16:29:23
-- Generated from EDMX file: C:\ProyectoColegio\Colegio\Library\Models\db.edmx
-- --------------------------------------------------


/*CORRER SOLO LA PRIMERA VEZ*/
--------CREATE DATABASE colegiodb



SET QUOTED_IDENTIFIER OFF;
GO
USE [colegiodb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Usuarios'
CREATE TABLE [dbo].[Usuarios] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(max)  NULL,
    [Password] nvarchar(max)  NULL,
    [Email] nvarchar(max)  NULL,
    [Nombre] nvarchar(max)  NULL,
    [Apellido] nvarchar(max)  NULL,
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

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------