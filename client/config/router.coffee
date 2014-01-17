App.Router.reopen
  location: 'history'

App.Router.map ->
  @route 'index', { path: '/' }

  @resource 'nights', { path: '/admin/nights' }, ->
    @route 'new'
    @resource 'night', { path: ':id'}

  @resource 'songs', { path: '/admin/songs' }, ->
    @route 'new'
    @resource 'song', { path: ':id' }

  @resource 'scriptures', { path: '/admin/scriptures' }, ->
    @route 'new'
    @resource 'scripture', { path: ':id' }

  @resource 'activities', { path: '/admin/activities' }, ->
    @route 'new'
    @resource 'activity', { path: ':id' }

  @route 'login'
  @route 'admin'