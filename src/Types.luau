export type IconState = "deselected" | "selected" | "viewing"
export type IconAlignment = "Left" | "Center" | "Right"

export type IconEventName = "selected" | "deselected" | "toggled" | "viewingStarted" | "viewingEnded" | "notified"

export type IconEvents = {
	selected: RBXScriptSignal<() -> ()>,
	deselected: RBXScriptSignal<() -> ()>,
	toggled: RBXScriptSignal<(isSelected: boolean) -> ()>,
	viewingStarted: RBXScriptSignal<() -> ()>,
	viewingEnded: RBXScriptSignal<() -> ()>,
	notified: RBXScriptSignal<() -> ()>,
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

export type Icon = IconEvents & {
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
	select: (self: Icon) -> Icon,
	deselect: (self: Icon) -> Icon,
	notify: (self: Icon, clearNoticeEvent: RBXScriptSignal?) -> Icon,
	clearNotices: (self: Icon) -> Icon,
	disableOverlay: (self: Icon, enabled: boolean) -> Icon,
	setImage: (self: Icon, imageId: string | number, iconState: IconState?) -> Icon,
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
}

export type IconContainer = {
	setTopbarEnabled: (enabled: boolean) -> (),
	setDisplayOrder: (order: number) -> (),
	getIcons: () -> { [string]: Icon },
	getIcon: (nameOrUID: string) -> Icon?,
	modifyBaseTheme: (modifications: Modifications) -> (),

	new: () -> Icon,
}

return nil
