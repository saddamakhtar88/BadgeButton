//
//  BadgeButton.swift
//  BadgeButtonSample
//
//  Created by Saddam Akhtar on 10/31/20.
//

import Foundation
import UIKit

public class BadgeButton: UIButton {
    
    private let _badgeBackground: UIView = UIView(frame: CGRect.zero)
    private let _badgeLabel: LabelPlus = LabelPlus(frame: CGRect.zero)
    
    private var _badgeTextHorizontalPadding: CGFloat = 4.0
    private var _badgeTextVerticalPadding: CGFloat = 4.0
    private var _badgeWidthConstraint: NSLayoutConstraint!
    private var _badgeHeightConstraint: NSLayoutConstraint!
    private var _badgeTrailingConstraint: NSLayoutConstraint!
    
    @IBInspectable public var badgeTextHorizontalPadding: CGFloat {
        get { return _badgeTextHorizontalPadding }
        set {
            _badgeTextHorizontalPadding = newValue
            _badgeWidthConstraint.constant = _badgeTextHorizontalPadding
        }
    }
    
    @IBInspectable public var badgeTextVerticalPadding: CGFloat {
        get { return _badgeTextVerticalPadding }
        set {
            _badgeTextVerticalPadding = newValue
            _badgeHeightConstraint.constant = _badgeTextVerticalPadding
        }
    }
    
    @IBInspectable public var badgeText: String? {
        get { return _badgeLabel.text }
        set {
            _badgeLabel.text = newValue
            invalidateIntrinsicContentSize()
        }
    }
    
    @IBInspectable public  var badgeTextColor: UIColor {
        get { return _badgeLabel.textColor }
        set {
            _badgeLabel.textColor = newValue
        }
    }
    
    @IBInspectable public  var badgeColor: UIColor? {
        get { return _badgeBackground.backgroundColor }
        set {
            _badgeBackground.backgroundColor = newValue
        }
    }
    
    public var badgeLabel: UILabel { get { _badgeLabel } }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initializeView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        initializeView()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        _badgeBackground.setNeedsLayout()
        _badgeBackground.layoutIfNeeded()
        _badgeBackground.layer.cornerRadius = min(_badgeBackground.frame.height, _badgeBackground.frame.width) / 2
        
        _badgeTrailingConstraint.constant = _badgeBackground.layer.cornerRadius
        
        
        bringSubviewToFront(_badgeBackground)
    }
    
    private func initializeView() {
        _badgeLabel.isUserInteractionEnabled = false
        _badgeLabel.translatesAutoresizingMaskIntoConstraints = false
        _badgeLabel.textAlignment = .center
        _badgeLabel.clipsToBounds = true
        _badgeBackground.addSubview(_badgeLabel)
        
        _badgeLabel.centerXAnchor.constraint(equalTo: _badgeBackground.centerXAnchor).isActive = true
        _badgeLabel.centerYAnchor.constraint(equalTo: _badgeBackground.centerYAnchor).isActive = true
        
        _badgeBackground.isUserInteractionEnabled = false
        _badgeBackground.translatesAutoresizingMaskIntoConstraints = false
        _badgeBackground.clipsToBounds = true
        addSubview(_badgeBackground)
        
        _badgeWidthConstraint = _badgeBackground.widthAnchor.constraint(equalTo: _badgeLabel.widthAnchor,
                                                                        constant: _badgeTextHorizontalPadding)
        _badgeHeightConstraint = _badgeBackground.heightAnchor.constraint(equalTo: _badgeLabel.heightAnchor,
                                                                          constant: _badgeTextVerticalPadding)
        
        _badgeWidthConstraint.isActive = true
        _badgeHeightConstraint.isActive = true
        
        _badgeBackground.centerYAnchor.constraint(equalTo: topAnchor).isActive = true
        _badgeTrailingConstraint = _badgeBackground.trailingAnchor.constraint(equalTo: trailingAnchor)
        _badgeTrailingConstraint.isActive = true
        
        let showHideBadge = { [unowned self] in
            _badgeBackground.isHidden = _badgeLabel.text?.isEmpty != false
        }
        
        showHideBadge()
        _badgeLabel.onTextChanged = {
            showHideBadge()
        }
    }
}

private class LabelPlus: UILabel {
    var onTextChanged: ()->Void = {}
    override var text: String? {
        didSet {
            onTextChanged()
        }
    }
    
    override var attributedText: NSAttributedString? {
        didSet {
            onTextChanged()
        }
    }
}
