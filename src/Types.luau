local Janitor = require(script.Parent.Packages.Janitor)
local Signal = require(script.Parent.Packages.Signal)

export type IconState = "deselected" | "selected" | "viewing"
export type IconAlignment = "Left" | "Center" | "Right"

export type IconEventName = "selected" | "deselected" | "toggled" | "viewingStarted" | "viewingEnded" | "notified"

export type IconEvents = {
	selected: Signal.Signal<>,
	deselected: Signal.Signal<>,
	toggled: Signal.Signal<boolean>,
	viewingStarted: Signal.Signal<>,
	viewingEnded: Signal.Signal<>,
	stateChanged: Signal.Signal<>,
	notified: Signal.Signal<>,
	noticeStarted: Signal.Signal<>,
	noticeChanged: Signal.Signal<>,
	endNotices: Signal.Signal<>,
	toggleKeyAdded: Signal.Signal<>,
	fakeToggleKeyChanged: Signal.Signal<>,
	alignmentChanged: Signal.Signal<>,
	updateSize: Signal.Signal<>,
	resizingComplete: Signal.Signal<>,
	joinedParent: Signal.Signal<>,
	menuSet: Signal.Signal<>,
	dropdownSet: Signal.Signal<>,
	updateMenu: Signal.Signal<>,
	startMenuUpdate: Signal.Signal<>,
	childThemeModified: Signal.Signal<>,
	indicatorSet: Signal.Signal<>,
	dropdownChildAdded: Signal.Signal<>,
	menuChildAdded: Signal.Signal<>,
}

type InferEventCallback = (self: Icon, isSelected: boolean?) -> ()

type WidgetInstances = {
	IconCorners: UICorner,
	Selection: Frame & { RotationSpeed: number },
	SelectionGradient: UIGradient,
	IconImage: ImageLabel,
	IconLabel: TextLabel,
	Widget: Frame & { MinimumWidth: number, MinimumHeight: number },
	IconButton: Frame,
	IconImageScale: NumberValue,
	IconImageCorner: UICorner,
	IconSpot: Frame,
	IconSpotGradient: UIGradient,
	IconOverlay: Frame,
	IconGradient: UIGradient,
	ClickRegion: TextButton,
	Menu: ScrollingFrame,
	ContentsList: UIListLayout,
	Dropdown: Frame & { MaxIcons: number },
	DropdownScroller: ScrollingFrame,
	DropdownCorner: UICorner,
	DropdownPadding: UIPadding,
	DropdownList: UIListLayout,
	Notice: Frame,
	NoticeLabel: TextLabel,
	PaddingLeft: Frame,
	PaddingRight: Frame,
	PaddingCenter: Frame,
	Contents: Frame,
	IconLabelContainer: Frame,
	IconImageRatio: UIAspectRatioConstraint,
}

type Modifications = { { any } } | { any }

type IconProperties = {
	janitor: Janitor.Janitor,
	themesJanitor: Janitor.Janitor,
	singleClickJanitor: Janitor.Janitor,
	captionJanitor: Janitor.Janitor,
	joinJanitor: Janitor.Janitor,
	menuJanitor: Janitor.Janitor,
	dropdownJanitor: Janitor.Janitor,

	UID: string,
	isEnabled: boolean,
	isSelected: boolean,
	isViewing: boolean,
	joinedFrame: boolean,
	parentIconUID: boolean,
	deselectWhenOtherIconSelected: boolean,
	totalNotices: number,
	activeState: string,
	alignment: string,
	originalAlignment: string,
	appliedTheme: { any },
	appearance: { any },
	cachedInstances: { [Instance]: boolean },
	cachedNamesToInstances: { [string]: Instance },
	cachedCollectives: { [string]: Instance },
	bindedToggleKeys: { [Enum.KeyCode]: boolean },
	customBehaviours: { [string]: (any, Instance, string) -> () },
	toggleItems: { [Instance]: boolean },
	bindedEvents: { [IconEventName]: (isSelected: boolean?) -> () },
	notices: { [string]: any },
	menuIcons: { string },
	dropdownIcons: { string },
	childIconsDict: { string },
	isOldTopbar: boolean,
	creationTime: number,

	locked: boolean,
	indicator: typeof(require(script.Parent.Elements.Indicator)(nil, nil)),
}

export type Image = {
	Image: string | number,
	ImageRectOffset: Vector2,
	ImageRectSize: Vector2,
}

export type Icon = IconEvents & IconProperties & {
	name: string,
	isSelected: boolean,
	enabled: boolean,
	totalNotices: number,
	locked: boolean,

	highlightKey: Enum.KeyCode,
	highlightIcon: boolean,

	setName: (self: Icon, name: string) -> Icon,
	getInstance: (self: Icon, instanceName: string) -> Instance,
	modifyTheme: (self: Icon, modifications: Modifications) -> Icon,
	modifyChildTheme: (self: Icon, modifications: Modifications) -> Icon,
	setEnabled: (enabled: boolean) -> Icon,
	setLeft: (self: Icon) -> Icon,
	setMid: (self: Icon) -> Icon,
	setRight: (self: Icon) -> Icon,
	select: (self: Icon) -> Icon,
	deselect: (self: Icon) -> Icon,
	notify: (self: Icon, clearNoticeEvent: Signal.Signal<>?) -> Icon,
	clearNotices: (self: Icon) -> Icon,
	disableOverlay: (self: Icon, enabled: boolean) -> Icon,
	setImage: (self: Icon, imageId: Image | string | number, iconState: IconState?) -> Icon,
	setImageRectOffset: (self: Icon, offset: Vector2, iconState: IconState?) -> Icon,
	setImageRectSize: (self: Icon, rectSize: Vector2, iconState: IconState?) -> Icon,
	setLabel: (self: Icon, text: string, iconState: IconState?) -> Icon,
	setOrder: (self: Icon, order: number, iconState: IconState?) -> Icon,
	setCornerRadius: (self: Icon, scale: number, offset: number, iconState: IconState?) -> Icon,
	align: (self: Icon, alignment: IconAlignment) -> Icon,
	setWidth: (self: Icon, minimumSize: number, iconState: IconState?) -> Icon,
	setImageScale: (self: Icon, scale: number, iconState: IconState?) -> Icon,
	setImageRatio: (self: Icon, ratio: number, iconState: IconState?) -> Icon,
	setTextSize: (self: Icon, size: number, iconState: IconState?) -> Icon,
	setTextFont: (
		self: Icon,
		font: Enum.Font | Font | string,
		fontWeight: Enum.FontWeight,
		fontStyle: Enum.FontStyle,
		iconState: IconState?
	) -> Icon,
	bindToggleItem: (self: Icon, item: GuiObject | LayerCollector) -> Icon,
	unbindToggleItem: (self: Icon, item: GuiObject | LayerCollector) -> Icon,
	bindEvent: (self: Icon, name: IconEventName, callback: InferEventCallback) -> Icon,
	unbindEvent: (self: Icon, name: IconEventName) -> Icon,
	bindToggleKey: (self: Icon, key: Enum.KeyCode) -> Icon,
	unbindToggleKey: (self: Icon, key: Enum.KeyCode) -> Icon,
	call: (self: Icon, func: (icon: Icon) -> ()) -> Icon,
	addToJanitor: (self: Icon, userdata: () -> () | thread | RBXScriptConnection) -> Icon,
	lock: (self: Icon) -> Icon,
	unlock: (self: Icon) -> Icon,
	debounce: (self: Icon, seconds: Icon) -> Icon,
	autoDeselect: (self: Icon, toggle: boolean) -> Icon,
	oneClick: (self: Icon, toggle: boolean) -> Icon,
	setCaption: (self: Icon, text: string?) -> Icon,
	setCaptionHint: (self: Icon, key: Enum.KeyCode) -> Icon,
	setDropdown: (self: Icon, icons: { Icon }) -> Icon,
	joinDropdown: (self: Icon, parent: Icon) -> Icon,
	setMenu: (self: Icon, icon: { Icon }) -> Icon,
	joinMenu: (self: Icon, parentIcon: { Icon }) -> Icon,
	leave: (self: Icon) -> Icon,
	destroy: (self: Icon) -> Icon,
	updateParent: (self: Icon) -> Icon,
	setBehaviour: (
		self: Icon,
		collectiveOrInstancesName: string,
		property: string,
		callback: (any, string, Instance) -> (),
		refreshAppearance: boolean?
	) -> Icon,
}

export type IconContainerEvents = {
	baseDisplayOrderChanged: Signal.Signal<number>,
	iconChanged: Signal.Signal<Icon>,
	iconRemoved: Signal.Signal<Icon>,
	iconAdded: Signal.Signal<Icon>,
}

export type IconContainerProperties = {
	topbarEnabled: boolean,
	isOldTopbar: boolean,
	baseDisplayOrder: boolean,
	baseTheme: typeof(require(script.Parent.Features.Themes.Default)),
}

export type IconContainer = IconContainerEvents & IconContainerProperties & {
	setTopbarEnabled: (enabled: boolean, isInternal: boolean?) -> (),
	setDisplayOrder: (order: number) -> (),
	getIcons: () -> { [string]: Icon },
	getIconByUID: (UID: string) -> Icon?,
	getIcon: (nameOrUID: string) -> Icon?,
	modifyBaseTheme: (modifications: Modifications) -> (),

	new: () -> Icon,
}

return nil
