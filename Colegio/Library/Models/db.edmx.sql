
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/24/2016 14:40:22
-- Generated from EDMX file: C:\ProyectoColegio\Colegio\Library\Models\db.edmx
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
IF OBJECT_ID(N'[dbo].[FK_EstudianteUsuario_Estudiante]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EstudianteUsuario] DROP CONSTRAINT [FK_EstudianteUsuario_Estudiante];
GO
IF OBJECT_ID(N'[dbo].[FK_EstudianteUsuario_Usuario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EstudianteUsuario] DROP CONSTRAINT [FK_EstudianteUsuario_Usuario];
GO
IF OBJECT_ID(N'[dbo].[FK_UsuarioProfesor_Usuario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UsuarioProfesor] DROP CONSTRAINT [FK_UsuarioProfesor_Usuario];
GO
IF OBJECT_ID(N'[dbo].[FK_UsuarioProfesor_Profesor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UsuarioProfesor] DROP CONSTRAINT [FK_UsuarioProfesor_Profesor];
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
IF OBJECT_ID(N'[dbo].[Profesores]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Profesores];
GO
IF OBJECT_ID(N'[dbo].[UsuarioRole]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UsuarioRole];
GO
IF OBJECT_ID(N'[dbo].[RolePermiso]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RolePermiso];
GO
IF OBJECT_ID(N'[dbo].[EstudianteUsuario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EstudianteUsuario];
GO
IF OBJECT_ID(N'[dbo].[UsuarioProfesor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UsuarioProfesor];
GO

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
    [Nombres] nvarchar(max)  NOT NULL,
    [Apellido] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Telefono] nvarchar(max)  NULL,
    [Celular] nvarchar(max)  NULL,
    [Status] bit  NOT NULL,
    [Fecha_ingreso] datetime  NOT NULL,
    [Ult_Fecha_act] datetime  NOT NULL
);
GO

-- Creating table 'Profesores'
CREATE TABLE [dbo].[Profesores] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombres] nvarchar(max)  NOT NULL,
    [Apellido] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Telefono] nvarchar(max)  NULL,
    [Celular] nvarchar(max)  NULL,
    [Status] bit  NOT NULL,
    [Fecha_ingreso] datetime  NOT NULL,
    [Ult_Fecha_act] datetime  NOT NULL
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

-- Creating table 'EstudianteUsuario'
CREATE TABLE [dbo].[EstudianteUsuario] (
    [Estudiantes_Id] int  NOT NULL,
    [Usuarios_Id] int  NOT NULL
);
GO

-- Creating table 'UsuarioProfesor'
CREATE TABLE [dbo].[UsuarioProfesor] (
    [Usuarios_Id] int  NOT NULL,
    [Profesors_Id] int  NOT NULL
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

-- Creating primary key on [Id] in table 'Profesores'
ALTER TABLE [dbo].[Profesores]
ADD CONSTRAINT [PK_Profesores]
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

-- Creating primary key on [Estudiantes_Id], [Usuarios_Id] in table 'EstudianteUsuario'
ALTER TABLE [dbo].[EstudianteUsuario]
ADD CONSTRAINT [PK_EstudianteUsuario]
    PRIMARY KEY CLUSTERED ([Estudiantes_Id], [Usuarios_Id] ASC);
GO

-- Creating primary key on [Usuarios_Id], [Profesors_Id] in table 'UsuarioProfesor'
ALTER TABLE [dbo].[UsuarioProfesor]
ADD CONSTRAINT [PK_UsuarioProfesor]
    PRIMARY KEY CLUSTERED ([Usuarios_Id], [Profesors_Id] ASC);
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

-- Creating foreign key on [Estudiantes_Id] in table 'EstudianteUsuario'
ALTER TABLE [dbo].[EstudianteUsuario]
ADD CONSTRAINT [FK_EstudianteUsuario_Estudiante]
    FOREIGN KEY ([Estudiantes_Id])
    REFERENCES [dbo].[Estudiantes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Usuarios_Id] in table 'EstudianteUsuario'
ALTER TABLE [dbo].[EstudianteUsuario]
ADD CONSTRAINT [FK_EstudianteUsuario_Usuario]
    FOREIGN KEY ([Usuarios_Id])
    REFERENCES [dbo].[Usuarios]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EstudianteUsuario_Usuario'
CREATE INDEX [IX_FK_EstudianteUsuario_Usuario]
ON [dbo].[EstudianteUsuario]
    ([Usuarios_Id]);
GO

-- Creating foreign key on [Usuarios_Id] in table 'UsuarioProfesor'
ALTER TABLE [dbo].[UsuarioProfesor]
ADD CONSTRAINT [FK_UsuarioProfesor_Usuario]
    FOREIGN KEY ([Usuarios_Id])
    REFERENCES [dbo].[Usuarios]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Profesors_Id] in table 'UsuarioProfesor'
ALTER TABLE [dbo].[UsuarioProfesor]
ADD CONSTRAINT [FK_UsuarioProfesor_Profesor]
    FOREIGN KEY ([Profesors_Id])
    REFERENCES [dbo].[Profesores]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioProfesor_Profesor'
CREATE INDEX [IX_FK_UsuarioProfesor_Profesor]
ON [dbo].[UsuarioProfesor]
    ([Profesors_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------